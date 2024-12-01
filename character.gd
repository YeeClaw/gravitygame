extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var collision: bool = false


func _physics_process(delta: float) -> void:
	# Make sure the character falls when suspended!
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("actor_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var input_dir := Input.get_vector("actor_left", "actor_right", "actor_up", "actor_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		update_velocity(direction)
	
	print(velocity)

	collision = move_and_slide()
	
func update_velocity(_direction) -> void:
	"""
	Mutates the players velocity based on the input direction.
	"""
	var x_thrust = Vector3(_direction.x, 0, 0)
	var z_thrust = Vector3(0, 0, _direction.z)
	
	if collision:
		velocity.x = 0
		velocity.z = 0
		
		return
	
	if abs(velocity.x + _direction.x) <= SPEED:
		velocity += x_thrust
		
	if abs(velocity.z + _direction.z) <= SPEED:
		velocity += z_thrust
		
