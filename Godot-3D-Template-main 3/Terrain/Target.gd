extends StaticBody

onready var Effects = get_node_or_null("/root/Game/Effects")
onready var Explosion = load("res://Explosion/Explosion.tscn")

func die():
	if Effects != null:
		var explosion = Explosion.instance()
		explosion.global_transform = global_transform
		Effects.add_child(explosion)
	Global.update_score(10)
	queue_free() 

