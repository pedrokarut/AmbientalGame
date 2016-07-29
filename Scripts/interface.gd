extends Node2D

var cenario = preload("res://Scenes/Cenario.scn").instance()

func _ready():
	pass

func _Jogar():
	add_child(cenario)

	

