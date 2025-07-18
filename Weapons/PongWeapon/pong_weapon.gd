class_name PongWeapon extends RigidBody2D

@export_group("Weapon properties")
@export_range(0.1, 5) var velocity_mul: float = 1.0;
@export var weapon_width: int = 256.0;

enum WeaponState {
	CARRIED,
	CARRIED_CHARGING,
	AIRBORNE_DANGER,
	AIRBORNE_HARMLESS,
	GROUNDED_STUCK,
	GROUNDED_LOOSE,
}

var current_state = WeaponState.CARRIED;
var current_process_func = self.process_carried;
var current_physics_func = self.process_physics_carried;
func change_state(state: WeaponState) -> void:
	current_state = state;

func _ready():
	var body_collider = $WeaponCollider;
	var sprite = $WeaponSprite;

	var sprite_rect = sprite.get_rect();
	var sprite_scale = weapon_width / sprite_rect.size[0];
	sprite.scale = Vector2(sprite_scale, sprite_scale);

	body_collider.shape = CircleShape2D.new();
	body_collider.shape.radius = weapon_width / 2;

	self.gravity_scale = 0.0;


func _process(delta: float) -> void:
	self.current_process_func.call(delta);

func _physics_process(delta: float) -> void:
	self.current_physics_func.call(delta);

func process_carried(delta: float) -> void:
	pass

func process_carried_charging(delta: float) -> void:
	pass

func process_airborne_danger(delta: float) -> void:
	pass

func process_airborne_harmless(delta: float) -> void:
	pass

func process_grounded_stuck(delta: float) -> void:
	pass

func process_grounded_loose(delta: float) -> void:
	pass

func process_physics_carried(delta: float) -> void:
	pass

func process_physics_carried_charging(delta: float) -> void:
	pass

func process_physics_airborne_danger(delta: float) -> void:
	pass

func process_physics_airborne_harmless(delta: float) -> void:
	pass

func process_physics_grounded_stuck(delta: float) -> void:
	pass

func process_physics_grounded_loose(delta: float) -> void:
	pass
