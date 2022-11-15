extends Node2D

export (PackedScene) var Object1
export (PackedScene) var Object2
var velocidad_por_nivel = 70

func _ready():
	velocidad_por_nivel = 70
func _on_ObjectTimer_timeout():
	var random_num = randi() % 2
	var obj
	if random_num == 0:
		obj = Object1.instance()
	elif random_num == 1:
		obj = Object2.instance()
	
	# Choose a random location on ObjPath
	var obj_spawn_location = get_node("ObjPath/ObjSpawnLocation")
	obj_spawn_location.offset = randi()

	# Set the objects's direction perpendicular to the path direction.
	var direction = obj_spawn_location.rotation + PI / 2

	# Set the object's position to a random location.
	obj.position = obj_spawn_location.position

	# Choose the velocity for the object
	
	var velocity = Vector2(velocidad_por_nivel, 0.0)
	obj.linear_velocity = velocity.rotated(direction)

	# Spawn the object by adding it to the Main scene.
	add_child(obj)

# Objects dissappear when leaving the screen
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

# Hide objects when collide with player
func on_hide_obj():
	queue_free()

#cambio de velocidad por nivel
func _on_personaje_cambio_velocidad_objetos():
	velocidad_por_nivel += 60 
