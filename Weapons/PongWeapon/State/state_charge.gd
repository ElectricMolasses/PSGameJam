extends State

@export var weapon_rigid_body: RigidBody2D
@export var weapon: PongWeapon
@export var charge_speed: float = 1
@export var charge_max: float = 2

var current_charge: float = 0


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
	weapon.gravity_scale = 0.0
	weapon.collision_layer = 0
	weapon.collision_mask = 0

func exit() -> void:
	weapon.sprite.modulate = Color(1, 1, 1)

func run_process(delta: float) -> void:
	weapon.snap_to_chase_node()
	weapon.sprite.modulate = Color(current_charge / charge_max + 1, 1, 1)
	current_charge += charge_speed * delta
	clamp(current_charge, 0, charge_max)

func run_physics_process(_delta: float) -> void:
	pass

func set_weapon(weapon: PongWeapon) -> void:
	self.weapon = weapon
