extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var collision: bool = false
var direction_indicator: Node3D


func _ready() -> void:
	var rng := RandomNumberGenerator.new()
	velocity = Vector3(rng.randi_range(-5, 5), 0, rng.randi_range(-5, 5))
	direction_indicator = $DirectionIndicator
	direction_indicator.hide()


func _physics_process(_delta: float) -> void:
	collision = move_and_slide()


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("toggle_perspective"):
		var current_camera: Camera3D = get_viewport().get_camera_3d()
		if current_camera == $TopCamera:
			$IsoCamera.make_current()
		else:
			$TopCamera.make_current()
