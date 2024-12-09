extends Node
class_name State # State names should always be in present tense

signal Transitioned # Is it possible to make an abstract warning? lol

func Enter():
	pass
	

func Exit():
	pass
	

func Update(_delta: float):
	pass
	

func Physics_Update(_delta: float):
	pass


func check_new_state() -> void:
	Transitioned.emit()
	push_error("Implement method `check_new_state()`")


static func switch_parent(child: Node2D, new_parent: Node2D) -> void:
	"""
	child: The node needing to be moved
	new_parent: The new parent of the node
	"""
	var global_position = child.global_position
	if child.get_parent() == new_parent:
		return
	else:
		child.get_parent().remove_child(child)
		new_parent.add_child(child)
		child.global_position = global_position
