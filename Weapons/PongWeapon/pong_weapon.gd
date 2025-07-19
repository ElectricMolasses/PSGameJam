class_name PongWeapon extends RigidBody2D

@export_group("Weapon properties")
@export_range(0.1, 5) var velocity_mul: float = 1.0
@export var weapon_width: int = 256
@export var chase_node: Node2D

var state_machine: StateManager
var sprite: Sprite2D

var action_map = {
	InputEventMouseMotion: WeaponAction.CHARGE,
}


func _ready() -> void:
	var body_collider = $WeaponCollider
	sprite = $WeaponSprite

	var sprite_rect = sprite.get_rect()
	var sprite_scale = weapon_width / sprite_rect.size[0]
	sprite.scale = Vector2(sprite_scale, sprite_scale)

	body_collider.shape = CircleShape2D.new()
	body_collider.shape.radius = weapon_width / 2.0

	self.gravity_scale = 0.0

	state_machine = $StateMachine
	state_machine.set_weapon(self)

func _process(_delta: float) -> void:
	pass

func _input(event):
	if event is InputEventMouseButton:
		state_machine.handle_action(PongWeaponAction.CHARGE)
	elif event is InputEventKey:
		state_machine.handle_action(PongWeaponAction.WIELD)

func snap_to_chase_node() -> void:
	if chase_node:
		position = chase_node.position
