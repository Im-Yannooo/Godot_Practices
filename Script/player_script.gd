extends CharacterBody2D


const SPEED = 300.0
var isIdle: bool = true
var isRunning: bool = true
var isAttacking: bool = true


func _physics_process(delta: float) -> void:
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	)

	if direction != Vector2.ZERO:
		if $AnimatedSprite2D.animation != "Run":
			$AnimatedSprite2D.play("Run")

		# Flip sprite when moving left
		if direction.x != 0:
			$AnimatedSprite2D.flip_h = direction.x < 0

		velocity = direction.normalized() * SPEED
	else:
		if $AnimatedSprite2D.animation != "Idle":
			$AnimatedSprite2D.play("Idle")

		velocity = Vector2.ZERO
		
	move_and_slide()
	
