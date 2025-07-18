extends State

const Charge = preload("res://Weapons/PongWeapon/State/Charge.gd")


@export var weapon_rigid_body: RigidBody2D
@export var chase_node: Node2D


func handle_action(action: Action) -> State:
	match action:
		WeaponAction.CHARGE:
			return Charge.new()
	return self


func enter() -> void:
	weapon_rigid_body.gravity_scale = 0.0
	weapon_rigid_body.collision_layer = 0
	weapon_rigid_body.collision_mask = 0

func exit() -> void:
	pass

func _process(delta: float) -> void:
	# Propel the book towards the chase node every frame.
	pass

func _physics_process(_delta: float) -> void:
	pass
