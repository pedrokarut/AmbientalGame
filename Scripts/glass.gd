
extends Node2D

var anim 

func _ready():
	anim = get_node("Area2D/Sprite/AnimationPlayer")
	get_node("Area2D").connect("body_enter", self, "_Colisao")
	set_process(true)
	
func _process(delta):
	var pos = get_pos()
	pos.y += 50 * delta
	set_pos(pos)
	

func _Colisao(body):
	anim.play("coletada")

func _destroy():
	Principal.qtdVidros = Principal.qtdVidros - 1
	self.queue_free()

