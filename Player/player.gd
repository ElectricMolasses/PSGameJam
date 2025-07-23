extends RigidBody2D

@export var force: int = 50
@export var max_speed: int = 600
@export var acceleration: float = 600
@export var jump_acceleration: int = 1000
var jump_triggered: bool = false

func _ready():
	pass

func _physics_process(delta: float) -> void:
	move_player(delta)

func move_player(delta: float) -> void:
	var input_direction = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		print("right")
		input_direction.x += acceleration * delta
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("move_right")
	if Input.is_action_pressed("move_left"):
		print("left")
		input_direction.x -= acceleration * delta
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("move_left")
	if Input.is_action_just_pressed("jump"):
		print("jump")
		jump_triggered = true
	
	input_direction.x = clamp(input_direction.x, -max_speed, max_speed)
	
	if input_direction != Vector2.ZERO:
		print(input_direction)
		self.move_and_collide(input_direction)   # <-- This seems to be the best answer for now
	
	if jump_triggered: 
		jump_triggered = false
		apply_impulse(Vector2(0, -1) * jump_acceleration)
		$AnimatedSprite2D.play("jump")
