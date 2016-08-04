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
export var pontuacao = 0 		#to storage all the pontuation


func _ready():
	if has_node("pontuacao/Pontos"):			#setar a pontuação 
		get_node("pontuacao/Pontos").set_text(str(pontuacao))
		
	set_process(true)
	
	if has_node("Painel_Informacoes"):
		get_node("Painel_Informacoes").show()
		
	
	

func _process(delta):
	
	time = time + delta
	
	

	if vidas == 2:		#to check the quantity of lives
		get_tree().get_current_scene().get_node("./vidas/vida3").hide()
	elif vidas == 1:
		get_tree().get_current_scene().get_node("./vidas/vida2").hide()
	elif vidas == 0:
		get_tree().get_current_scene().get_node("./vidas/vida1").hide()
		get_tree().set_pause(true)
	#when the game ends and we have to show the pontuation
		get_tree().get_current_scene().get_node("gerados").hide()
		get_tree().get_current_scene().get_node("./Painel_Game_Over/lblTempo").set_text(str(time))
		get_tree().get_current_scene().get_node("./Painel_Game_Over/lblPontuacao").set_text(str(pontuacao))
		get_tree().get_current_scene().get_node("./Painel_Game_Over").show()
		vidas = 3
	

	if qtdbag ==0:		#to create new bags
		var bag_instance = bag.instance()
		get_tree().get_current_scene().get_node("gerados").add_child(bag_instance)
		bag_instance.set_pos(Vector2(rand_range(0,600), rand_range(150,400)))
		print("Saco criado")
		qtdbag = qtdbag + 1
		get_tree().get_current_scene().get_node("pontuacao/Pontos").set_text(str(pontuacao)) #to update the pontuation
		
		
	if qtdbanana ==0:		#to create new bananas
		var banana_instance = banana.instance()
		get_tree().get_current_scene().get_node("gerados").add_child(banana_instance)
		var bananaPos = banana_instance.get_pos()
		banana_instance.set_pos(Vector2(rand_range(0,600), rand_range(150,400)))
		qtdbanana = qtdbanana + 1
		get_tree().get_current_scene().get_node("pontuacao/Pontos").set_text(str(pontuacao))	#to update the pontuation
		
	if qtdmacas ==0:		#to create new apples
		var maca_instance = maca.instance(true)
		get_tree().get_current_scene().get_node("gerados").add_child(maca_instance)
		maca_instance.set_pos(Vector2(rand_range(0,600), rand_range(150,400)))
		qtdmacas = qtdmacas + 1
		get_tree().get_current_scene().get_node("pontuacao/Pontos").set_text(str(pontuacao))	#to update the pontuation
		
	if qtdVidros ==0:		#to create new glasses
		var vidro = glass.instance(true)
		get_tree().get_current_scene().get_node("gerados").add_child(vidro)
		vidro.set_pos(Vector2(rand_range(0,600), 150))
		qtdVidros = qtdVidros + 1
		get_tree().get_current_scene().get_node("pontuacao/Pontos").set_text(str(pontuacao))	#to update the pontuation
	
	if qtdbarris <=0:
		var barril_instance = barril.instance(true)
		get_tree().get_current_scene().get_node("gerados").add_child(barril_instance)
		barril_instance.set_pos(Vector2(rand_range(0,600), 150))
		qtdbarris = qtdbarris + 1

	


func _button_pressed():			#to pause  the game
	get_tree().set_pause(true)
	get_tree().get_current_scene().get_node("./PauseMenu/btPlay").show()
	get_tree().get_current_scene().get_node("./PauseMenu/btPause").hide()
	
func _button_play_pressed():	#to restart the game
	get_tree().set_pause(false)
	get_tree().get_current_scene().get_node("./PauseMenu/btPlay").hide()
	get_tree().get_current_scene().get_node("./PauseMenu/btPause").show()
	
func _button_Recomecar_pressed():			
	#to play again when the phase ends, readd lives and pontuation
	get_tree().get_current_scene().get_node("./Painel_Game_Over").hide()
	get_tree().set_pause(false)
	get_tree().get_current_scene().get_node("gerados").show()
	get_tree().get_current_scene().get_node("./vidas/vida3").show()
	get_tree().get_current_scene().get_node("./vidas/vida2").show()
	get_tree().get_current_scene().get_node("./vidas/vida1").show()
	get_tree().get_current_scene().get_node("./pontuacao/Pontos").set_text(str(0))
	pontuacao = 0

func _button_continuar_painel_informacoes_pressed():
	get_tree().set_pause(false)
	get_node("Painel_Informacoes").hide()
	
