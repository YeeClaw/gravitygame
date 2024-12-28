extends Node3D

var camera: Camera3D

func _ready():
	print("Hello from direction indicator")
	camera = $"../TopCamera"


func _process(_delta):
	#Tells the direction indicator to look at the cursor
	look_at(camera.physical_mouse_pos)
