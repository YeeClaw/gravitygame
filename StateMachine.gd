extends Node
class_name StateMachine

@export var initial_state : State

var current_state : State
var states : Dictionary = {}

# Will need to update FSM to handle multiple states at a time or some kind sub-state system.

func _ready():
	# Create a dictionary full of states which are children to THIS node.
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transition)
			
	if initial_state:
		initial_state.Enter()
		current_state = initial_state


func _process(delta):
	if current_state: # Evaluates to true if current_state is NOT null/None.
		current_state.Update(delta)
		

func _physics_process(delta):
	if current_state:
		current_state.Physics_Update(delta)


func on_child_transition(state, new_state_name):
	if state != current_state:
		return
		
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
		
	if current_state:
		current_state.Exit()
		
	new_state.Enter()
	
	current_state = new_state
