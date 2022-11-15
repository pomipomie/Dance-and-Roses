extends Node2D

export (PackedScene) var rosa
export (PackedScene) var tomate
export (PackedScene) var botitas
export (PackedScene) var comedia
export (PackedScene) var drama
export (PackedScene) var piano
export (PackedScene) var bolsa

var objeto_instanciado
signal cambio_comedia
signal cambio_drama
signal cambio_estandar
var estado

func _ready():
	estado = 0
	randomize()
 
func _on_timer_objetos_timeout():
	var tipo = randi() % 101
	# de 0 a 29 es una rosa
	if tipo >=0 and tipo < 30:
		objeto_instanciado = rosa.instance()
		if estado == 1:
			objeto_instanciado.gravity_scale = 0.5
		elif estado == 2:
			objeto_instanciado.gravity_scale = 5
		elif estado == 0:
			objeto_instanciado.gravity_scale = 1
		objeto_instanciado.position.x = 250 + randi()%780
		objeto_instanciado.position.y = -10
	#de 30 a 79 es un tomate
	elif tipo >=30 and tipo < 80:
		objeto_instanciado = tomate.instance()
		if estado == 1:
			objeto_instanciado.gravity_scale = 0.5
		elif estado == 2:
			objeto_instanciado.gravity_scale = 5
		elif estado == 0:
			objeto_instanciado.gravity_scale = 1
		objeto_instanciado.position.x = 150 + randi()%900
		objeto_instanciado.position.y = -10
	#de 80 a 87 son botitas
	elif tipo >=80 and tipo < 88:
		objeto_instanciado = botitas.instance()
		if estado == 1:
			objeto_instanciado.gravity_scale = 0.5
		elif estado == 2:
			objeto_instanciado.gravity_scale = 5
		elif estado == 0:
			objeto_instanciado.gravity_scale = 1
		objeto_instanciado.position.x = 50 + randi()%900
		objeto_instanciado.position.y = -10
	#de 88 a 90 es comedia	
	elif tipo >=88 and tipo < 91:
		objeto_instanciado = comedia.instance()
		if estado == 1:
			objeto_instanciado.gravity_scale = 0.5
		elif estado == 2:
			objeto_instanciado.gravity_scale = 5
		elif estado == 0:
			objeto_instanciado.gravity_scale = 1
		objeto_instanciado.position.x = 150 + randi()%900
		objeto_instanciado.position.y = -10
	#de 91 a 93 es drama
	elif tipo>=91 and tipo < 94:
		objeto_instanciado = drama.instance()
		if estado == 1:
			objeto_instanciado.gravity_scale = 0.5
		elif estado == 2:
			objeto_instanciado.gravity_scale = 5
		elif estado == 0:
			objeto_instanciado.gravity_scale = 1
		objeto_instanciado.position.x = 150 + randi()%800
		objeto_instanciado.position.y = -10
	# de 94 a 100
	elif tipo>=94 and tipo < 96:
		objeto_instanciado = piano.instance()
		if estado == 1:
			objeto_instanciado.gravity_scale = 0.1
		elif estado == 2:
			objeto_instanciado.gravity_scale = 7
		elif estado == 0:
			objeto_instanciado.gravity_scale = 1
		objeto_instanciado.position.x = 150 + randi()%800
		objeto_instanciado.position.y = -10
		
	elif tipo>=96 and tipo < 101:
		objeto_instanciado = bolsa.instance()
		if estado == 1:
			objeto_instanciado.gravity_scale = 0.1
		elif estado == 2:
			objeto_instanciado.gravity_scale = 7
		elif estado == 0:
			objeto_instanciado.gravity_scale = 1
		objeto_instanciado.position.x = 150 + randi()%800
		objeto_instanciado.position.y = -10
	#agregamos lo que se instancio, sea cual sea
	add_child(objeto_instanciado)

#cuando le llega la señal de comedia desde el main, cambia el estado
func _on_Main_inicio_comedia():
	 estado = 1
func _on_Main_inicio_drama():
	estado = 2
func _on_Main_normalidad():
	estado = 0
func _on_interfaz_normalidad():
	estado = 0
