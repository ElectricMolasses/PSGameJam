class_name StateManager extends Node


@export var states: Array[State] = [];


func new() -> StateManager:
	return self

func _ready() -> void:
	pass

func handle_action(action: int) -> void:
	pass
