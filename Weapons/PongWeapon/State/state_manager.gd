extends StateManager

@export var weapon_rigid_body: RigidBody2D

var chase_node: Node2D

var carried_state: State
var charge_state: State

var current_state: State

func _ready() -> void:
	carried_state = $Carried
	charge_state = $Charge

	carried_state.weapon_rigid_body = weapon_rigid_body

	current_state = carried_state

func _process(delta: float) -> void:
	current_state.run_process(delta)

func _physics_process(delta: float) -> void:
	current_state.run_physics_process(delta)

func set_chase_node(chase_node: Node2D) -> void:
	print("AHHHH")
	print(chase_node)
	self.chase_node = chase_node
	for state in self.get_children():
		state.set_chase_node(chase_node)
