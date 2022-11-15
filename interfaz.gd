extends CanvasLayer
var personaje
signal reintentar
signal nuevo_nivel
signal normalidad

func _ready():
	$menu_pausa.visible = false
	$creditos.visible = false
	$game_over.visible = false
	personaje = get_tree().get_nodes_in_group("bailarina")

#menu pausa:

func _on_boton_pausa_main_pressed():
	$iu_select.playing = true
	$menu_pausa.visible = true
	$boton_pausa_main.visible = false
	get_tree().paused = true

func _on_boton_pausa_volver_pressed():
	$iu_select.playing = true
	$menu_pausa.visible = false
	$boton_pausa_main.visible = true
	get_tree().paused = false

func _on_boton_pausa_salir_pressed():
	$iu_select.playing = true
	get_tree().quit()

#creditos:

func _on_boton_pausa_creditos_pressed():
	$iu_select.playing = true
	$menu_pausa.visible = false
	$creditos.visible = true

func _on_boton_volver_creditos_pressed():
	$iu_select.playing = true
	$menu_pausa.visible = true
	$creditos.visible = false


#Game Over
func _on_boton_salir_GO_pressed():
	$iu_select.playing = true
	get_tree().quit()
	
func _on_boton_reintentar_pressed():
	$iu_select.playing = true
	get_tree().paused = false
	$menu_pausa.visible = false
	$creditos.visible = false
	$game_over.visible = false
	emit_signal("reintentar")
	emit_signal("normalidad")
	
func _on_personaje_victoria():
	get_tree().paused = true
	$aplausos_win.playing = true
	$menu_pausa.visible = false
	$creditos.visible = false
	$game_over.visible = false
	$win.visible = true

func _on_personaje_derrota():
	$abucheos_game_over.playing = true
	get_tree().paused = true
	$game_over.visible = true

#Victoria
func _on_boton_salir_win_pressed():
	$iu_select.playing = true
	get_tree().quit()
	
func _on_boton_siguiente_nivel_pressed():
	$iu_select.playing = true
	get_tree().paused = false
	$win.visible = false
	emit_signal("nuevo_nivel")
