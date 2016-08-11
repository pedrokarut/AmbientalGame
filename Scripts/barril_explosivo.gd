extends Node2D

var anim 

func _ready():
	set_process(true)
	get_node("Area2D").connect("body_enter",self,"_Colisao")
	anim = get_node("Area2D/AnimatedSprite/AnimationPlayer")
	anim.play("move")
	
func _process(delta):

	var pos = get_pos()
	pos.y += 100 * delta
	set_pos(pos)
	
	if pos.y > 700:
		_destroy()

func _Colisao(body):
	var pos = get_node("Area2D").get_pos()
	
	if body.get_name() == "KinematicSuitMan2D":
		anim.play("explosion")
		Principal.vidas = Principal.vidas - 1
	
func _destroy():
	Principal.qtdbarris = Principal.qtdbarris - 1
	self.queue_free()


