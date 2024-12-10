extends State

var state_machine: StateMachine
var character: CharacterBody3D

var input_dir: Vector2
var direction: Vector3

func Enter():
	state_machine = self.get_parent()
	character = state_machine.get_parent()
	
	print("Floating!")
	print(character.velocity)
	

func Physics_Update(_delta: float):
	input_dir = Input.get_vector("actor_left", "actor_right", "actor_up", "actor_down")
	direction = (character.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	#if direction:
		#update_velocity()
	
	check_new_state()
	

func update_velocity() -> void:
	"""
	Mutates the players velocity based on the input direction.
	"""
	var x_thrust = Vector3(direction.x, 0, 0)
	var z_thrust = Vector3(0, 0, direction.z)
	
	
	if abs(character.velocity.x + direction.x) <= character.SPEED:
		character.velocity += x_thrust
		
	if abs(character.velocity.z + direction.z) <= character.SPEED:
		character.velocity += z_thrust
	

func check_new_state():
	if character.collision and Input.is_action_just_pressed("actor_release"):
		Transitioned.emit(self, "GrabbingWall")
