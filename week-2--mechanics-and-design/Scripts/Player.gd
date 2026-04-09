extends CharacterBody2D

const GRAVITY = 900.0
const JUMP_FORCE = -420.0
const RUN_SPEED = 250.0

func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Jump with W or Space
	if (Input.is_action_just_pressed("ui_accept") or Input.is_key_pressed(KEY_W)) and is_on_floor():
		velocity.y = JUMP_FORCE

	# Horizontal movement with A and D
	if Input.is_key_pressed(KEY_D):
		velocity.x = RUN_SPEED
	elif Input.is_key_pressed(KEY_A):
		velocity.x = -RUN_SPEED
	else:
		velocity.x = 0

	move_and_slide()
