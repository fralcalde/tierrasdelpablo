class_name DummyAIController
extends ActorController


func _process(_delta) -> void:
	var vel = get_random_movement()
	actor.move(vel)


func get_random_movement() -> Vector2:
	var vel = Vector2.ZERO
	vel.x = randi() % 3 - 1
	vel.y = randi() % 3 - 1
	return vel
