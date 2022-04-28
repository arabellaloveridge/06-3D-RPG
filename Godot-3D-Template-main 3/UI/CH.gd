extends Control

onready var UI = $"."
onready var right = $Right
onready var left = $Left
onready var up = $Up
onready var down = $Down

var can_shoot = true
var CH_recoil_pos = 100

func _ready():
	pass
	
func shoot(delta):
	if Input.is_action_just_pressed("shoot") and can_shoot:
		up.position = lerp(up.position, Vector2(0, -CH_recoil_pos), 3*delta)
		down.position = lerp(down.position, Vector2(0, CH_recoil_pos), 3*delta)
		left.position = lerp(left.position, Vector2(-CH_recoil_pos, 0), 3*delta)
		right.position = lerp(right.position, Vector2(CH_recoil_pos, 0), 3*delta)
		
		can_shoot = false
		
		if down.position > Vector2(0,60):
			CH_recoil_pos = 60
		
		CH_recoil_pos += 4
		yield(get_tree().create_timer(.25), "timeout")
		can_shoot = true
		
	if not Input.is_action_pressed("shoot") and can_shoot:
		for ch in UI.get_children():
			ch.position = lerp(ch.position, Vector2.ZERO, 3*delta)
			CH_recoil_pos -= ch.position.x
			
func _physics_process(delta):
	shoot(delta)

