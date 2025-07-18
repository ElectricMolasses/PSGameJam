extends State

@export var Carried: State
@export var Airborne: State


@export var weapon_rigid_body: RigidBody2D
@export var chase_node: Node2D
@export var charge_speed: float = 1
@export var charge_max: float = 2


var current_charge: float = 0

func handle_action(action: Action) -> State:
	match action:
		WeaponAction.WIELD:
			var next_state = Carried.new()
			next_state.velocity = current_charge
		WeaponAction.THROW:
			return Airborne.new()

	return self

func enter() -> void:
	weapon_rigid_body.gravity_scale = 0.0
	weapon_rigid_body.collision_layer = 0
	weapon_rigid_body.collision_mask = 0

func exit() -> void:
	pass

func run_process(delta: float) -> void:
	current_charge += charge_speed * delta
	clamp(current_charge, 0, charge_max)

func run_physics_process(_delta: float) -> void:
	pass

func set_chase_node(chase_node: Node2D) -> void:
	self.chase_node = chase_node
