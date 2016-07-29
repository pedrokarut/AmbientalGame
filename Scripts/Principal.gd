extends Node2D

var bag = preload("res://Scenes/bag.scn")				#to preload the scene bag
var banana = preload("res://Scenes/casca_banana.scn")	#to preload the scene banana
var maca = preload("res://Scenes/maça.scn")				#to preload the scene maça
var glass = preload("res://Scenes/glass.scn")			#to preload the glass scene
var time = 0					#to save the gam's time
export var qtdbanana = 0		#to keep all the bananas that are on the scene
export var qtdgarrafa = 0		#to keep all the bottles that are on the scene
export var qtdbag = 0			#to keep all the bags that are on the scene
export var qtdVidros = 0		#to keep all the glass that are on the scene
export var qtdmacas = 0			#to keep all the apples that are on the scene
export var bananasColetadas = 0		#to save all the colected bananas
export var bagsColetadas = 0		#to save all the colected bags
export var macasColetadas = 0	#to save all the colected apples
export var vidrosColetados = 0	#to save all the colected glass


func _ready():
	get_tree().set_pause(false)
	set_process(true)
	
	

func _process(delta):
	
	time = time + delta	
	
	
	
	if qtdbag ==0:		#to create new bags
		var bag_instance = bag.instance()
		get_tree().get_root().add_child(bag_instance)
		var bagPos = bag_instance.get_pos()
		bagPos.x = (rand_range(0,600))
		bagPos.y += 50 * delta
		bag_instance.set_pos(bagPos)
		print("Saco criado")
		qtdbag = qtdbag + 1
		
		
	if qtdbanana ==0:		#to create new bananas
		var banana_instance = banana.instance()
		get_tree().get_root().add_child(banana_instance)
		var bananaPos = banana_instance.get_pos()
		banana_instance.set_pos(Vector2(rand_range(0,600), rand_range(0,400)))
		print("Banana criada")
		qtdbanana = qtdbanana + 1
		
	if qtdmacas ==0:		#to create new apples
		var maca_instance = maca.instance(true)
		get_tree().get_root().add_child(maca_instance)
		var macaPos = maca_instance.get_pos()
		maca_instance.set_pos(Vector2(rand_range(0,600), rand_range(0,400)))
		qtdmacas = qtdmacas + 1
		print("Maça criada")
		
	if qtdVidros ==0:		#to create new glasses
		var vidro = glass.instance(true)
		get_tree().get_root().add_child(vidro)
		var vidroPos = vidro.get_pos()
		vidro.set_pos(Vector2(rand_range(0,600), 0))
		qtdVidros = qtdVidros + 1
		print("Vidro Criado")
		

	
	
	
	
	
	
	
	
	
	