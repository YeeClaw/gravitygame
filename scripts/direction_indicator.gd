extends Node3D


func _ready():
    print("Hello from direction indicator")


func _process(_delta):
    #Tells the direction indicator to look at the cursor
    var flat_mouse_position: Vector2 = get_viewport().get_global_mouse_position()
    var thiccc_mouse_position := Vector3(flat_mouse_position.x, 0, flat_mouse_position.y)
    print(thiccc_mouse_position)
    look_at(thiccc_mouse_position)