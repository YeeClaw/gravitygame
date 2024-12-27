extends Node3D

var camera: Camera3D

func _ready():
	print("Hello from direction indicator")
	camera = $TopCamera


func _process(_delta):
    #Tells the direction indicator to look at the cursor
	var flat_mouse_position: Vector2 = get_viewport().get_mouse_position()
	var thiccc_mouse_position := Vector3(flat_mouse_position.x, 0, flat_mouse_position.y)
	print(thiccc_mouse_position)
	look_at(camera.physical_mouse_pos)
