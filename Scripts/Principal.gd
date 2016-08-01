extends Node2D

var inicial = preload("res://Scenes/interface.scn").instance()
var bag = preload("res://Scenes/bag.scn")				#to preload the scene bag
var banana = preload("res://Scenes/casca_banana.scn")	#to preload the scene banana
var maca = preload("res://Scenes/maça.scn")				#to preload the scene maça
var glass = preload("res://Scenes/glass.scn")			#to preload the glass scene
var barril = preload("res://Scenes/barril_explosivo.scn")		#to preload the barrel scene
var time = 0					#to save the gam's time
export var qtdbanana = 0		#to keep all the bananas that are on the scene
export var qtdbarris = 0 		#to save all the explosive barrels
export var qtdgarrafa = 0		#to keep all the bottles that are on the scene
export var qtdbag = 0			#to keep all the bags that are on the scene
export var qtdVidros = 0		#to keep all the glass that are on the scene
export var qtdmacas = 0			#to keep all the apples that are on the scene
export var bananasColetadas = 0		#to save all the colected bananas
export var bagsColetadas = 0		#to save all the colected bags
export var macasColetadas = 0	#to save all the colected apples
export var vidrosColetados = 0	#to save all the colected glass
export var vidas = 3 			#to storage all the lives



func _ready():
	set_process(true)
	
	if has_node("Painel_Informacoes"):
		get_node("Painel_Informacoes").show()
	
	

func _process(delta):
	
	time = time + delta	
	
	if vidas == 2:		#to check the quantity of lives
		get_tree().get_current_scene().get_node("game/vidas/vida3").hide()
	elif vidas == 1:
		get_tree().get_current_scene().get_node("game/vidas/vida2").hide()
	elif vidas == 0:
		get_tree().get_current_scene().get_node("game/vidas/vida1").hide()
		get_tree().get_current_scene().get_node("game/Painel_Game_Over").show()
		get_tree().set_pause(true)
	
	
	if qtdbag ==0:		#to create new bags
		var bag_instance = bag.instance()
		get_tree().get_root().add_child(bag_instance)
		bag_instance.set_pos(Vector2(rand_range(0,600), rand_range(150,400)))
		print("Saco criado")
		qtdbag = qtdbag + 1
		
		
	if qtdbanana ==0:		#to create new bananas
		var banana_instance = banana.instance()
		get_tree().get_root().add_child(banana_instance)
		var bananaPos = banana_instance.get_pos()
		banana_instance.set_pos(Vector2(rand_range(0,600), rand_range(150,400)))
		print("Banana criada")
		qtdbanana = qtdbanana + 1
		
	if qtdmacas ==0:		#to create new apples
		var maca_instance = maca.instance(true)
		get_tree().get_root().add_child(maca_instance)
		maca_instance.set_pos(Vector2(rand_range(0,600), rand_range(150,400)))
		qtdmacas = qtdmacas + 1
		print("Maça criada")
		
	if qtdVidros ==0:		#to create new glasses
		var vidro = glass.instance(true)
		get_tree().get_root().add_child(vidro)
		vidro.set_pos(Vector2(rand_range(0,600), 150))
		qtdVidros = qtdVidros + 1
		print("Vidro Criado")
	
	if qtdbarris <=0:
		var barril_instance = barril.instance(true)
		get_tree().get_root().add_child(barril_instance)
		barril_instance.set_pos(Vector2(rand_range(0,600), 150))
		qtdbarris = qtdbarris + 1
		print("Barril criado")
		


func _button_pressed():			#to pause  the game
	get_tree().set_pause(true)
	get_tree().get_current_scene().get_node("game/PauseMenu/btPlay").show()
	get_tree().get_current_scene().get_node("game/PauseMenu/btPause").hide()
	
func _button_play_pressed():	#to restart the game
	get_tree().set_pause(false)
	get_tree().get_current_scene().get_node("game/PauseMenu/btPlay").hide()
	get_tree().get_current_scene().get_node("game/PauseMenu/btPause").show()

func _button_continuar_painel_informacoes_pressed():
	get_tree().set_pause(false)
	get_node("Painel_Informacoes").hide()
	

func _button_Recomecar_pressed():
	get_tree().get_current_scene().get_node("game/Painel_Game_Over").hide()
	add_child(inicial)

	


	
	
	