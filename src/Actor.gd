class_name Actor
extends KinematicBody2D


export var starting_stats : Resource
onready var stats = $ActorStats
# var inventory
# var skills

# Called when the node enters the scene tree for the first time.
func _ready():
	stats.initialize_stats(starting_stats)

