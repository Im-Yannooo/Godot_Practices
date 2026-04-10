extends Node2D

var speed := 200.0
var direction := Vector2(1, 1)

func _process(delta: float) -> void:
	var screen = get_viewport_rect().size

	position += direction * speed * delta

	if position.x < 0 or position.x > screen.x:
		direction.x *= -1

	if position.y < 0 or position.y > screen.y:
		direction.y *= -1
