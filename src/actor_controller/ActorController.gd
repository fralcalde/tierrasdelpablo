"""
This is the base class for plug-and-play behaviours for actors.
This class calls the commands defined for each controller.

Classes like PlayerController and AIController inherit from this.

Later on you can have ZombieAIController, GoblinAIController with different 
behaviours
"""
class_name ActorController
extends Node2D

var actor : Actor

func _ready():
	var parent = get_parent()
	if parent is Actor:
		actor = parent
	
	if not actor:
		printerr("Owner of this controller isn't an actor - ", name)
		set_process(false)
		set_physics_process(false)

