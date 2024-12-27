extends Camera3D

var player: CharacterBody3D
var mouse_position: Vector2
var player_plane: Plane
var physical_mouse_pos: Vector3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("Character")
	player_plane = Plane(Vector3.UP, player.position)


func _physics_process(_delta: float) -> void:
	mouse_position = get_viewport().get_mouse_position()

	var ray_origin := project_ray_origin(mouse_position)
	var ray_end := ray_origin + project_ray_normal(mouse_position * 20)

	physical_mouse_pos = player_plane.intersects_ray(ray_origin, ray_end)	
