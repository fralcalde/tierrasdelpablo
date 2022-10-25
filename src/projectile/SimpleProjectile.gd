extends KinematicBody2D

var SPEED = 100
var dir = Vector2.RIGHT
var velocity = Vector2.ZERO
var lifetime = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	$LifeTime.start(lifetime)


func _physics_process(delta):
	velocity = dir * SPEED * delta
	velocity = move_and_collide(velocity)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_LifeTime_timeout():
	queue_free()
