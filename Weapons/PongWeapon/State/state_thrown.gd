extends State

@export var drag: float = 1
@export var gravity: float = 1

var weapon: PongWeapon
var velocity: float = 0

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

func exit() -> void:
	velocity = 0
	exiting = true

func run_process(delta: float) -> void:
	pass

func run_physics_process(delta: float) -> void:
	weapon.apply_force(Vector2(velocity, 0) * delta)
	velocity -= (velocity * 0.1 * delta)
	# Toggle a flag once the weapon exits the players collider
	# This will let the player catch the weapon on the next collision

func run_integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	pass

func set_weapon(weapon: PongWeapon) -> void:
	self.weapon = weapon
