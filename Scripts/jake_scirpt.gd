extends Node2D


const velocity = 150
var anim
var jake_kin

func _ready():
	set_process_input(true)
	set_fixed_process(true)
	anim = get_node("jake_kinem/jake_sprite/jake_anim")
	jake_kin = get_node("jake_kinem")
	
	
func _fixed_process(delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("ui_left"):
		if anim.is_playing() == false:
			anim.play("walk_left")
			motion += Vector2(-5,0)
	
	if Input.is_action_pressed("ui_right"):		
		if anim.is_playing() == false:
			anim.play("walk_right")
			motion += Vector2(5,0)
				
	if Input.is_action_pressed("ui_up"):				
		if anim.is_playing() == false:
			anim.play("walk_up")
			motion += Vector2(0,-5)
						
	if Input.is_action_pressed("ui_down"):					
		if anim.is_playing() == false:
			anim.play("walk_down")
			motion += Vector2(0,5)
	
	motion = motion * velocity * delta
	jake_kin.move(motion)
			
		
			
func _input(event):
	pass