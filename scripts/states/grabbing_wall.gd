extends State

var state_machine: StateMachine
var character: CharacterBody3D

var input_dir: Vector2
var direction: Vector3


func Enter():
	state_machine = self.get_parent()
	character = state_machine.get_parent()
	print("Grabbing a wall!")
	
	character.velocity = Vector3(0, 0, 0)
	character.direction_indicator.show()
	
	
func Physics_Update(_delta: float):
	input_dir = Input.get_vector("actor_left", "actor_right", "actor_up", "actor_down")
	direction = (character.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	check_new_state()
	

func check_new_state() -> void:
	#print(direction)
	#print(Input.is_action_just_pressed("actor_release"))
	
	if Input.is_action_just_pressed("actor_release"):
		character.velocity = Vector3(direction.x * character.SPEED, 0, direction.z * character.SPEED)
		Transitioned.emit(self, "Floating")


func Exit() -> void:
	#Hides the direction indicator
	character.direction_indicator.hide()