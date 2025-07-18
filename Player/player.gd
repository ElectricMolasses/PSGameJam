extends RigidBody2D

@export var force: int = 50
@export var max_speed: int = 10
@export var acceleration: float = 60

func _ready():
	pass

func _physics_process(delta: float) -> void:
	pass
	move_player(delta)

func move_player(delta: float) -> void:
	var input_direction = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		input_direction.x += acceleration * delta
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("move_right")
	if Input.is_action_pressed("move_left"):
		input_direction.x -= acceleration * delta
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("move_left")
	if Input.is_action_just_pressed("jump"):
		input_direction.y += 10
		$AnimatedSprite2D.play("jump")
	input_direction.x = clamp(input_direction.x, -max_speed, max_speed)
	
	if input_direction != Vector2.ZERO:
		apply_central_impulse(input_direction * force)
