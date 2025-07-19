extends State

@export var drag: float = 1
@export var gravity: float = 1

var weapon: PongWeapon
var velocity: float = 0


func handle_action(action: int) -> State:
	match action:
		WeaponAction.WIELD:
			return self
	return self

func enter() -> void:
	weapon.gravity_scale = gravity
	weapon.collision_layer = 0 # Weapon Layer
	# We may need a separate collider to handle enemies vs terrain
	weapon.collision_mask = 0 # Enemy and Terrain

func exit() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	pass

func set_weapon(weapon: PongWeapon) -> void:
	self.weapon = weapon
