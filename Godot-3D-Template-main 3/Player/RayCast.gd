extends RayCast

onready var Player = get_node("/root/Game/Player")

func _physics_process(_delta):
	if is_colliding():
		Player.target = get_collider()
	elif not is_colliding():
		Player.target = null
