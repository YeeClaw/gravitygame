extends State

var state_machine: StateMachine
var character: CharacterBody3D

var input_dir: Vector2
var direction: Vector3
var launch_speed: float


func Enter():
	state_machine = self.get_parent()
	character = state_machine.get_parent()
	print("Grabbing a wall!")
	
	character.velocity = Vector3(0, 0, 0)
	character.direction_indicator.show()
	
	
func Physics_Update(_delta: float):
	input_dir = Input.get_vector("actor_left", "actor_right", "actor_up", "actor_down")
	
	var mouse_pos = character.get_node("TopCamera").physical_mouse_pos
	var relative_pos = mouse_pos - character.global_position
	relative_pos.y = 0
	direction = relative_pos.normalized()
	launch_speed = clampf(relative_pos.length(), 0.0, character.SPEED)

	check_new_state()
	

func check_new_state() -> void:
	#print(direction)
	#print(Input.is_action_just_pressed("actor_release"))
	
	if Input.is_action_just_pressed("actor_release"):
		character.velocity = Vector3(direction.x * launch_speed, 0, direction.z * launch_speed)
		Transitioned.emit(self, "Floating")


func Exit() -> void:
	#Hides the direction indicator
	character.direction_indicator.hide()
