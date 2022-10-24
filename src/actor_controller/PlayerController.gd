class_name PlayerController
extends ActorController


func _process(_delta):
	handle_move_input()
	handle_mouse_input()


func handle_move_input() -> void:
	var vel = Vector2.ZERO
	vel.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	vel.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	actor.move(vel)


func handle_mouse_input() -> void:
	var m_pos = actor.get_global_mouse_position()
	actor.look_at(m_pos)
