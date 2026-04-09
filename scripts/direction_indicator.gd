extends Node3D

var camera: Camera3D

func _ready():
	camera = $"../TopCamera"
	var mesh = find_child("Layer*", true, false) as MeshInstance3D
	if mesh:
		var material = mesh.get_active_material(0).duplicate() as StandardMaterial3D
		material.no_depth_test = true
		material.render_priority = 127
		mesh.material_override = material


func _process(_delta):
	#Tells the direction indicator to look at the cursor
	look_at(camera.physical_mouse_pos)
