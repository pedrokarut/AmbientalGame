extends Node2D

var bag = preload("res://Scenes/bag.scn")
var banana = preload("res://Scenes/casca_banana.scn")
var garrafa = preload("res://Scenes/bottle.scn")
var maca = preload("res://Scenes/maça.scn")
var time = 0
export var qtdbanana = 0
export var qtdgarrafa = 0
export var qtdbag = 0


func _ready():
	set_process(true)

func _process(delta):
	time = time + delta
	
	if qtdbag == 0:
		novo_bag()
		novo_bag()
	if qtdbanana == 0:
		nova_banana()
		nova_banana()
	if qtdgarrafa == 0:
		nova_garrafa()
		nova_garrafa()

	
    
	
func nova_banana():
	var banana_instance = banana.instance()
	add_child(banana_instance)
	var bananaPos = banana_instance.get_pos()
	banana_instance.set_pos(Vector2(rand_range(0,600), rand_range(0,550)))
	print("Banana criada")
	qtdbanana = qtdbanana + 1
	
func nova_garrafa():
	var garrafa_instance = garrafa.instance()
	add_child(garrafa_instance)
	var garrafaPos = garrafa_instance.get_pos()
	garrafa_instance.set_pos(Vector2(rand_range(0,600), rand_range(0,550)))
	print("Garrafa criada")
	qtdgarrafa = qtdgarrafa + 1
	
func novo_bag():
	var bag_instance = bag.instance()
	add_child(bag_instance)
	var bagPos = bag_instance.get_pos()
	bag_instance.set_pos(Vector2(rand_range(0,600), rand_range(0,550)))
	print("Saco criado")
	qtdbag = qtdbag + 1
	
	
	
	
	
	
	
	
	