extends Node
signal inicio_comedia
signal inicio_drama
signal normalidad

func _ready():
	randomize()
	$timer_objetos.start()
	$musica_de_fondo.play()

func _on_musica_de_fondo_finished():
	$musica_de_fondo.playing = true

#el personaje le manda señal de que se choco con un comedia
func _on_personaje_comedia():
	#empieso el contador 
	$control_estados.start()
	#cambio el fondo 
	$Fondo.animation = "comedia"
	#le aviso a los objetos para que bajen gravedad
	emit_signal("inicio_comedia")

#cuando eprsonaje emite señal de drama...
func _on_personaje_drama():
	$control_estados.start()
	$Fondo.animation = "drama"
	emit_signal("inicio_drama")
	
#cuando termine el contador avisa a objetos quye vuelvan a la normalidad
func _on_control_estados_timeout():
	$Fondo.animation = "normal"
	emit_signal("normalidad")
