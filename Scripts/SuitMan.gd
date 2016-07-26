extends Node2D

const velocity = 100
var anim = ""
var anim_player = null
var anim_new = ""
var jake_kin

func _ready():
	set_process_input(true)
	set_fixed_process(true)
	anim_player = get_node("KinematicSuitMan2D/SpriteSuitMan/AnimationPlayer")
	jake_kin = get_node("KinematicSuitMan2D")
	
	
func _fixed_process(delta):
	var motion = Vector2()
	
	if anim != anim_new:
		anim_new = anim
		anim_player.play(anim, 0,2)
		
	
	if Input.is_action_pressed("ui_left"):
		anim = "left"
		motion += Vector2(-1,0)
	
	elif Input.is_action_pressed("ui_right"):
		anim = "right"
		motion += Vector2(1,0)
		
	elif Input.is_action_pressed("ui_up"):
		anim = "back"
		motion += Vector2(0,-1)
	
	elif Input.is_action_pressed("ui_down"):
		anim = "front"
		motion += Vector2(0,1)
	
	else:
		anim = "idle"

	
	motion = motion * velocity * delta
	jake_kin.move(motion)

	

func _input(event):
	pass