extends Node2D

var anim 

func _ready():
	set_process(true)
	anim = get_node("Area2D/Sprite/AnimationPlayer")
	anim.play("fall")

func _process(delta):
	
	var pos = get_pos()
	pos.y += 30 * delta
	set_pos(pos)
	


func _destroy():
	self.queue_free()

func _on_Area2D_area_enter( area ):
	anim.play("fade")
