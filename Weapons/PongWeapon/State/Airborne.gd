extends State

@export var Carried: State


@export var weapon_rigid_body: RigidBody2D
@export var drag: float = 1
@export var gravity: float = 1


var velocity: float = 0

func handle_action(action: Action) -> State:
	match action:
		WeaponAction.WIELD:
			return Carried.new()
	return self

func enter() -> void:
	weapon_rigid_body.gravity_scale = gravity
	weapon_rigid_body.collision_layer = 0 # Weapon Layer
	# We may need a separate collider to handle enemies vs terrain
	weapon_rigid_body.collision_mask = 0 # Enemy and Terrain

func exit() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	pass
