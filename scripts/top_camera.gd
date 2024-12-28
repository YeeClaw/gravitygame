extends Camera3D

var player: CharacterBody3D
var mouse_position: Vector2
@export var physical_mouse_pos: Vector3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_parent()


func _physics_process(_delta: float) -> void:
	mouse_position = get_viewport().get_mouse_position()

	var ray_direction := project_ray_normal(mouse_position)
	var ray_origin := project_ray_origin(mouse_position)

	if player.player_plane.intersects_ray(ray_origin, ray_direction):
		physical_mouse_pos = player.player_plane.intersects_ray(ray_origin, ray_direction)	
	else:
		physical_mouse_pos = player.position + Vector3.RIGHT
