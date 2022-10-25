class_name PlayerController
extends ActorController


func _process(_delta):
	handle_move_input()
	handle_mouse_input()


func _unhandled_input(event):
	if event.is_action_pressed("primary_skill"):
		cast_primary_skill()
	if event.is_action_pressed("secondary_skill"):
		pass
	if event.is_action_pressed("ultimate_skill"):
		pass


func handle_move_input() -> void:
	var vel = Vector2.ZERO
	vel.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	vel.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	actor.move(vel)


func handle_mouse_input() -> void:
	var m_pos = actor.get_global_mouse_position()
	actor.look_at(m_pos)


func cast_primary_skill() -> void:
	var target = actor.get_global_mouse_position()
	
	actor.cast_primary_skill(target)

