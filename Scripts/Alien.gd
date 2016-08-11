extends Node2D

var alien
var velocity = 200

func _ready():
	alien = get_node("Sprite")
	set_process(true)
	
func _process(delta):

	var pos = alien.get_pos()
	pos.x += velocity * delta
	alien.set_pos(pos)
	