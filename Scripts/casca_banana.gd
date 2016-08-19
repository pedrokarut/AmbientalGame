extends Node2D

var anim 

func _ready():
	anim = get_node("banana_area/banana_sprite/AnimationPlayer")



func _on_banana_area_body_enter( body ):
	get_node("SamplePlayer").play("Power_Up")
	anim.play("fade")