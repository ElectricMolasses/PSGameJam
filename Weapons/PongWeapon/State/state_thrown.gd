extends State

@export var drag: float = 1
@export var gravity: float = 1

var weapon: PongWeapon
var velocity: float = 0
var initial_trajectory: Vector2

var exiting: bool = false


func handle_action(action: int) -> State:
	match action:
		WeaponAction.WIELD:
			return self
	return self

func enter() -> void:
	weapon.collision_layer = 0 # Weapon Layer
	# We may need a separate collider to handle enemies vs terrain
	weapon.collision_mask = 0 # Enemy, Terrain and player

	velocity = velocity * weapon.velocity_mul
	initial_trajectory = weapon.get_aim_vector()

func exit() -> void:
	velocity = 0
	exiting = true

func run_physics_process(delta: float) -> void:
	weapon.apply_force(initial_trajectory * velocity * delta)
	velocity -= (velocity * 0.5 * delta)
	# Toggle a flag once the weapon exits the players collider
	# This will let the player catch the weapon on the next collision

@warning_ignore("shadowed_variable")
func set_weapon(weapon: PongWeapon) -> void:
	self.weapon = weapon
