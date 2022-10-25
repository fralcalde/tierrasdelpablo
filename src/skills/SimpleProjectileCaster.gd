class_name SimpleProjectileSkill
extends Skill

export var projectile_texture : Texture
export var projectile_pscene : PackedScene


func _ready():
	pass


func execute(target: Vector2, actor_stats : ActorStats):
	print("Casted ", name, " with ", actor_stats.intelligence, " int.")
	var projectile_scene = projectile_pscene.instance()
	projectile_scene.dir = target.normalized()
	projectile_scene.position = global_position
	get_tree().root.add_child(projectile_scene)
