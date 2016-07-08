extends Node2D

var bag_anim
var lblTotal 
var total

func _ready():
	bag_anim = get_node("bag_area/bag_sprite/bag_anim")
	get_node("bag_area").connect("body_enter",self,"_Colisao")
	lblTotal = 	get_tree().get_root().get_node("game/lblLixoColetado/lblTotal")
	
func _Colisao( body ):
	bag_anim.play("coletado")
	total = int(lblTotal.get_text()) + 1
	lblTotal.set_text(var2str(total)) #function to convert a var to string
	
func _destroy():
	self.queue_free()
	print("OK")