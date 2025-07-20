class_name PongWeapon extends RigidBody2D

@export_group("Weapon properties")
@export_range(100, 10000) var velocity_mul: float = 2000.0
@export var weapon_width: int = 64
@export var chase_node: Node2D
@export var aim_node: Node2D

@export_group("Test properties")
@export var initial_state: State

var state_machine: StateManager
var sprite: Sprite2D

var action_map = {
	InputEventMouseMotion: WeaponAction.CHARGE,
}


func _ready() -> void:
	var body_collider = $WeaponCollider
	sprite = $WeaponSprite

	can_sleep = false

	var sprite_rect = sprite.get_rect()
	var sprite_scale = weapon_width / sprite_rect.size[0]
	sprite.scale = Vector2(sprite_scale, sprite_scale)

	body_collider.shape = CircleShape2D.new()
	body_collider.shape.radius = weapon_width / 2.0

	state_machine = $StateMachine
	state_machine.set_weapon(self)

func _input(event):
	if event is InputEventMouseButton:
		state_machine.handle_action(PongWeaponAction.CHARGE)
	elif event.as_text() == "S":
		state_machine.handle_action(PongWeaponAction.WIELD)
	elif event.as_text() == "A":
		state_machine.handle_action(PongWeaponAction.THROW)

func snap_to_chase_node() -> void:
	if chase_node:
		linear_velocity = Vector2.ZERO
		angular_velocity = 0.0
		global_transform = chase_node.global_transform
		PhysicsServer2D.body_set_state(get_rid(), PhysicsServer2D.BODY_STATE_TRANSFORM, chase_node.global_transform)
		reset_physics_interpolation()

func get_aim_vector() -> Vector2:
	return aim_node.position - self.position
