class_name ActorStats
extends Node

# Estos valores se consiguen de la siguiente grafica:
# https://www.desmos.com/calculator/umznbmitl7
var EXP_OFFSET = 10
var EXP_LINEAR_FACTOR = 4
var EXP_EXPONENT = 1.8

signal health_depleted()
signal health_changed(new_health)
signal mana_changed(new_mana)
signal leveled_up()


var starting_stats : Resource setget initialize_stats
var actor_class
var health setget set_health
var max_health
var mana setget set_mana
var max_mana
var strength
var agility
var intelligence
var experience
var experience_total
var level
var skill_points

# Called when the node enters the scene tree for the first time.
func initialize_stats(stats_resource : StartingActorStats):
	assert(stats_resource is StartingActorStats,\
	"Loaded a stats module without starting stats")
	
	starting_stats = stats_resource
	
	actor_class = starting_stats.job_class
	health = starting_stats.max_health
	max_health = starting_stats.max_health
	mana = starting_stats.max_mana
	max_mana = starting_stats.max_mana
	strength = starting_stats.strength
	agility = starting_stats.agility
	intelligence = starting_stats.intelligence
	experience = starting_stats.experience
	experience_total = starting_stats.experience
	level = starting_stats.level
	skill_points = starting_stats.skill_points


func set_health(new_health : int):
	health = new_health
	emit_signal("health_changed", health)
	
	if health <= 0:
		emit_signal("health_depleted")


func set_mana(new_mana : int):
	mana = new_mana
	emit_signal("mana_changed", mana)
	
	if mana <= 0:
		mana = 0


func get_required_exp(_level : int) -> int:
	var required = pow(_level, EXP_EXPONENT) + _level * EXP_LINEAR_FACTOR + EXP_OFFSET
	return int(required)


func add_experience(amount : int):
	assert(amount >= 0, "Tried to substract experience")
	experience_total += amount
	experience += amount
	
	# We could have received enough experience to level up several times.
	while experience >= get_required_exp(level):
		level_up()


func level_up():
	experience = experience - get_required_exp(level)
	level = level + 1
	skill_points += 1
	emit_signal("leveled_up")
