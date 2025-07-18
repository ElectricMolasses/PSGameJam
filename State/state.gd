class_name State extends Node


func new() -> State:
	return self

##	State based input management. Accept all actions and handle the
##   allowable ones.
func handle_action(action: Action) -> State:
	return self;

## Any logic that needs to run when the state is transitioned into.
func enter() -> void:
	pass

## Any logic that needs to run when the state is transitioned out of.
##  Returns the next state.
func exit() -> void:
	pass

func initialize() -> void:
	pass

func run_process(delta: float) -> void:
	pass

func run_physics_process(delta: float) -> void:
	pass
