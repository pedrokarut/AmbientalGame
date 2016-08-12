extends Node2D

var bag_anim
var lblTotal 
var total

func _ready():
	bag_anim = get_node("bag_area/bag_sprite/bag_anim")
	get_node("bag_area").connect("body_enter",self,"_Colisao")

	
func _Colisao( body ):
	get_node("SamplePlayer").play("Power_Up")
	bag_anim.play("coletado")

func _destroy():
	Principal.pontuacao = Principal.pontuacao + 10
	Principal.qtdbag = Principal.qtdbag - 1
	Principal.bagsColetadas = Principal.bagsColetadas + 1
	print(Principal.qtdbag)
	self.queue_free()