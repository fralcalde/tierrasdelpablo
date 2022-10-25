class_name Actor
extends KinematicBody2D


export var starting_stats : Resource
export var starting_skills : Resource
onready var stats = $ActorStats
# var inventory
onready var primary_skill = $PrimarySkill

var _velocity : Vector2
var MOVE_SPEED = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	stats.initialize_stats(starting_stats)


func _physics_process(_delta):
	_velocity = move_and_slide(_velocity)


func move(vel):
	_velocity = vel.normalized() * MOVE_SPEED


func cast_primary_skill(target : Vector2):
	var skill = primary_skill.get_child(0)
	if skill == null:
		return
	
	$PrimarySkill.look_at(target)
	skill.execute(target, stats)
