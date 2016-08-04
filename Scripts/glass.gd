
extends Node2D

var anim 

func _ready():
	anim = get_node("Area2D/Sprite/AnimationPlayer")
	get_node("Area2D").connect("body_enter", self, "_Colisao")
	

func _Colisao(body):
	anim.play("coletada")

func _destroy():
	Principal.pontuacao = Principal.pontuacao + 10
	Principal.qtdVidros = Principal.qtdVidros - 1
	self.queue_free()

