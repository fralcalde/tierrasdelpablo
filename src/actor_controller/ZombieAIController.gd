class_name ZombieAIController
extends ActorController

var enemy : Actor

func _process(_delta):
	if enemy:
		var dir = enemy.get_global_position() - actor.get_global_position() 
		actor.move(dir.normalized())


func _on_DetectionArea_body_entered(body):
	if body is Actor and body != actor:
		set_enemy(body)


func set_enemy(body):
	enemy = body
