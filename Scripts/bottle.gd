extends Node2D

var anim 


func _ready():
	anim = get_node("bottle_area/bottle_sprite/bottle_anim")
	get_node("bottle_area").connect("body_enter",self,"_Colisao")
	
		
func _Colisao( body ):
	anim.play("coletada")


	
func _destroy():
	Principal.qtdgarrafa = Principal.qtdgarrafa - 1
	Principal.garrafasColetadas = Principal.garrafasColetadas + 1
	Print(Principal.qtdgarrafa)
	self.queue_free()



