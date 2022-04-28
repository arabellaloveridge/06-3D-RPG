extends Control


func _ready():
	$Label.text = "You win!\n\nYour final score was: " + str(Global.score)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_Play_Again_pressed():
	Global.reset()
	get_tree().change_scene("res://Game.tscn")


func _on_Quit_pressed():
	get_tree().quit()
