extends Node2D

var inicial = preload("res://Scenes/interface.scn").instance()


func _ready():	
	get_tree().change_scene("res://Scenes/interface.scn")


	


func _on_Button_pressed():
	add_child(inicial)
	get_tree().get_root().get_node("/root/Principal").set_pause_mode(false)
