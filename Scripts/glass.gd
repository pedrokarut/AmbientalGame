extends Node2D

var anim 

func _ready():
	anim = get_node("Area2D/Sprite/AnimationPlayer")
	get_node("Area2D").connect("body_enter", self, "_Colisao")
	

func _Colisao(body):
	get_node("SamplePlayer").play("Power_Up")
	anim.play("coletada")

