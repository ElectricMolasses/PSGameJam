extends State

var weapon: PongWeapon
var charge_state: State


func new():
	self.weapon = weapon
	return self

func handle_action(action: int) -> State:
	match action:
		WeaponAction.CHARGE:
			return get_parent().charge_state
	return self

func enter() -> void:
	weapon.collision_layer = 0
	weapon.collision_mask = 0

func exit() -> void:
	pass

func run_process(_delta: float) -> void:
	weapon.snap_to_chase_node()
	pass

func run_physics_process(_delta: float) -> void:
	pass

func set_weapon(weapon: PongWeapon) -> void:
	self.weapon = weapon
