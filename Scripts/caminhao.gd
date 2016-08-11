extends Node2D

var speed = 400
var animplayer
var anim = ""
var animnew = ""

func _ready():
	set_process(true)
	animplayer = get_node("AnimationPlayer")
	
func _process(delta):
	
	var pos = get_pos()
	
	if anim != animnew:
		animnew = anim
		animplayer.play(animnew)
	
	if Input.is_action_pressed("ui_left"):
		pos.x -= speed * delta
		set_pos(pos)
		anim = "walk_left"
	
	elif Input.is_action_pressed("ui_right"):
		pos.x += speed * delta
		set_pos(pos)
		anim = "walk_right"
		
	else:
		anim = "idle"


