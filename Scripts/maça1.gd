extends Node2D

var anim

func _ready():
	anim = get_node("maça_area/maça_sprite/maça_anim")
	get_node("maça_area").connect("body_enter",self,"_Colisao")

	
func _Colisao(body):
	get_node("SamplePlayer").play("Power_Up")
	anim.play("coletada")


