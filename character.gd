extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var collision: bool = false


func _ready() -> void:
	var rng := RandomNumberGenerator.new()
	velocity = Vector3(rng.randi_range(-5, 5), 0, rng.randi_range(-5, 5))
	print(velocity)
	

func _physics_process(delta: float) -> void:
	collision = move_and_slide()
	
