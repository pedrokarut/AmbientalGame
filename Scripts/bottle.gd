extends Node2D

var anim 
var lblTotal 
var total


func _ready():
	anim = get_node("bottle_area/bottle_sprite/bottle_anim")
	get_node("bottle_area").connect("body_enter",self,"_Colisao")
	lblTotal = 	get_tree().get_root().get_node("game/lblLixoColetado/lblTotal")
		
func _Colisao( body ):
	anim.play("coletada")
	total = int(lblTotal.get_text()) + 1
	lblTotal.set_text(var2str(total)) #function to convert a var to string
	
func _destroy():
	self.queue_free()
	print("Destroyed")	


