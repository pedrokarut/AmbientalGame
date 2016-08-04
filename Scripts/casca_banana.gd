extends Node2D

var anim 

func _ready():
	anim = get_node("banana_area/banana_sprite/AnimationPlayer")
	anim.connect("finished", self, "_destroy")



func _on_banana_area_body_enter( body ):
	anim.play("fade")
	
func _destroy():
	Principal.pontuacao = Principal.pontuacao + 10
	Principal.qtdbanana = Principal.qtdbanana -1
	Principal.bananasColetadas = Principal.bananasColetadas + 1
	print(Principal.qtdbanana) 
	self.queue_free()
