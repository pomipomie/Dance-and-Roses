extends Node

func _ready():
	randomize()
	$ObjectTimer.start()
	$musica_de_fondo.play()

func _on_musica_de_fondo_finished():
	$musica_de_fondo.playing = true
