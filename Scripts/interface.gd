extends Node2D

var cenario = preload("res://Scenes/Cenario.scn")


func _ready():
	get_tree().set_pause(true)

func _Jogar():
	var cenario_instance = cenario.instance()
	add_child(cenario_instance)


	

