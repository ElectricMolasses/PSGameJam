extends State

var charge_speed: float = 1
var charge_max: float = 2
var weapon: PongWeapon

var current_charge: float = 0
var exiting: bool = false


func handle_action(action: int) -> State:
	match action:
		WeaponAction.WIELD:
			self.exit()

			return get_parent().carried_state
		WeaponAction.THROW:
			var next_state = get_parent().thrown_state
			next_state.velocity = current_charge

			return next_state

	return self

func enter() -> void:
	exiting = false
	weapon.collision_layer = 0
	weapon.collision_mask = 0
	initialize_charge_speed()
	initialize_charge_max()

func exit() -> void:
	exiting = true
	current_charge = 0
	weapon.sprite.modulate = Color(1, 1, 1)

func run_process(delta: float) -> void:
	if exiting:
		return

	weapon.snap_to_chase_node()
	weapon.sprite.modulate = Color(current_charge / charge_max + 1, 1, 1)
	current_charge += charge_speed * delta
	clamp(current_charge, 0, charge_max)

@warning_ignore("shadowed_variable")
func set_weapon(weapon: PongWeapon) -> void:
	self.weapon = weapon

func initialize_charge_speed() -> void:
	charge_speed = weapon.get_charge_speed()

func initialize_charge_max() -> void:
	charge_max = weapon.get_charge_max()
