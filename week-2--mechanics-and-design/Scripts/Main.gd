extends Node2D

var current_level = 1

func _ready():
	load_level(1)

func load_level(n: int):
	current_level = n

	# Remove old level immediately
	for child in get_children():
		child.queue_free()

	# Use call_deferred to wait until queue_free is done
	call_deferred("_spawn_level", n)

func _spawn_level(n: int):
	var path = "res://Scenes/Level " + str(n) + ".tscn"
	var level = load(path).instantiate()
	add_child(level)

	# Connect finishzone
	var finish = level.find_child("Finishzone", true, false)
	if finish:
		finish.level_finished.connect(_on_level_finished)
		print("Connected Level " + str(n))
	else:
		print("NOT FOUND in Level " + str(n))
		# Print all children for debug
		for c in level.get_children():
			print(" - " + c.name)

	if n == 2:
		print("LEVEL 2 LOADED!")

func _on_level_finished():
	if current_level == 1:
		load_level(2)
	else:
		print("You win!")
