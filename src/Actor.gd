class_name Actor
extends KinematicBody2D


export var starting_stats : Resource
onready var stats = $ActorStats
# var inventory
# var skills

var _velocity : Vector2
var MOVE_SPEED = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	stats.initialize_stats(starting_stats)


func _physics_process(_delta):
	_velocity = move_and_slide(_velocity)


func move(vel):
	_velocity = vel.normalized() * MOVE_SPEED

