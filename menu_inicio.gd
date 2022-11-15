extends Node
func _ready():
	$CanvasLayer/fondo.set_frame(0)
#cuando presionas comenzar, empieza la 
#animacion del telon
func _on_boton_comenzar_pressed():
	$iu_select.playing = true
	$CanvasLayer/fondo.playing = true
	$musica_fondo_menu.playing = false
	
func _on_boton_salir_pressed():
	$iu_select.playing = true
	get_tree().quit()
#y cuando termina la animacion del telon, se cambia de escena
func _on_fondo_animation_finished():
	get_tree().change_scene("res://Main.tscn")
