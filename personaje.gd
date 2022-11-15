extends KinematicBody2D

export var speed = 200
export var nivel: int = 1
export var reputacion_actual = 0
export var reputacion_max = 50 
export var vida_max = 100
export var vida_actual = 100
var barra_de_vida
var barra_de_reputacion
var ventana_size
signal derrota
signal victoria
signal cambio_velocidad_objetos



# Called when the node enters the scene tree for the first time.
func _ready():
	nivel = 1
	reputacion_actual = 0
	vida_actual = 100
	ventana_size = get_viewport_rect().size
	barra_de_reputacion = get_tree().get_nodes_in_group("reputacion")[0]
	barra_de_vida = get_tree().get_nodes_in_group("vida")[0]

#funcion que actualiza la barra con la via del pj
func actualizar_barras():
	barra_de_vida.value = vida_actual
	barra_de_reputacion.value = int((reputacion_actual*100) / reputacion_max)
#control de victoria y derrota, emision de señales a interface
func control_condicion():
	if vida_actual <= 0:
		emit_signal("derrota")
		print("emiti señal derrota")
	if reputacion_actual >= reputacion_max:
		emit_signal("victoria")

func _process(delta):
	#llamada a actualizacion continua de variables de control
	actualizar_barras()
	control_condicion()
	#control de movilidad del personaje
	if Input.is_action_pressed("ui_right"):
		position.x += speed * delta
		
	if Input.is_action_pressed("ui_left"):
		position.x -= speed * delta
		
	position.x = clamp(position.x,150, ventana_size.x-150)

func _on_Area2D_body_entered(body):
	#control de lo que pasa cuando colisiona un objeto
	if body.is_in_group("flor"):
		reputacion_actual+= 10
		$flores_audio.playing = true
	if body.is_in_group("tomate"):
		vida_actual-=10
		$tomate_audio.playing = true 
	if body.is_in_group("items"):
		body.hide()
	
func _on_interfaz_reintentar():
	nivel = 1
	reputacion_actual = 0
	vida_actual = 100


func _on_interfaz_nuevo_nivel():
	nivel += 1
	reputacion_max = 50 * nivel / 2
	reputacion_actual = 0
	vida_actual = 100
	emit_signal("cambio_velocidad_objetos")
