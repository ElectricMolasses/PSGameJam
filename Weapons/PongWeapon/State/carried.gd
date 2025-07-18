extends State


var weapon_rigid_body: RigidBody2D
var chase_node: Node2D

var charge_state: State


func new():
	self.weapon_rigid_body = weapon_rigid_body
	self.chase_node = chase_node
	return self

func handle_action(action: Action) -> State:
	match action:
		WeaponAction.CHARGE:
			return charge_state
	return self

func enter() -> void:
	weapon_rigid_body.gravity_scale = 0.0
	weapon_rigid_body.collision_layer = 0
	weapon_rigid_body.collision_mask = 0

func exit() -> void:
	pass

func run_process(delta: float) -> void:
	# Propel the book towards the chase node every frame.
	pass

func run_physics_process(_delta: float) -> void:
	print(weapon_rigid_body)
	print(chase_node)
	weapon_rigid_body.position = chase_node.position

func set_chase_node(chase_node: Node2D) -> void:
	self.chase_node = chase_node
