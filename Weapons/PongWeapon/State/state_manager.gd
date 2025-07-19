extends StateManager

@export var weapon_rigid_body: RigidBody2D

var weapon: PongWeapon

var carried_state: State
var charge_state: State
var thrown_state: State

var current_state: State


func _ready() -> void:
	carried_state = $Carried
	charge_state = $Charge
	thrown_state = $Thrown

	current_state = carried_state

func _process(delta: float) -> void:
	current_state.run_process(delta)

func _physics_process(delta: float) -> void:
	current_state.run_physics_process(delta)

## Passes a requested action to the current state where the
##		state is responsible for handling it.
## args:
##		action: PongWeaponAction
func handle_action(action: int) -> void:
	var next_state = current_state.handle_action(action)
	current_state.exit()

	current_state = next_state
	current_state.enter()

func set_weapon(weapon: PongWeapon) -> void:
	self.weapon = weapon
	for state in self.get_children():
		state.set_weapon(weapon)
