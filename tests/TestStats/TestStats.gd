extends Node

export var starting_stats : Resource
onready var stats = $ActorStats
# var inventory
# var skills

# Called when the node enters the scene tree for the first time.
func _ready():
	stats.initialize_stats(starting_stats)


func _unhandled_input(event):
	if event.is_action_pressed("ui_up"):
		stats.add_experience(5)
		print("Level: ", stats.level,\
		", Exp: ", stats.experience,\
		", NextLevel: ", stats.get_required_exp(stats.level),\
		", Total: ", stats.experience_total,\
		", SkillPoints: ", stats.skill_points)
