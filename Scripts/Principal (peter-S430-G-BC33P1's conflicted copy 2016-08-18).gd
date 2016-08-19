extends Node2D

var lixos
var time = 0					#to save the game's time
var start = false

func _ready():
	

	if has_node("Painel_Informacoes"):
		get_node("Painel_Informacoes").show()
		
	set_process(true)
	

func _process(delta):
	
	time = time + delta
	
	if has_node("vidas"):


	#	if vidas == 2:		#to check the quantity of lives
			#get_tree().get_current_scene().get_node("./vidas/vida3").hide()
			#get_node("vidas/vida3").hide()
		#elif vidas == 1:
	#		get_tree().get_current_scene().get_node("./vidas/vida2").hide()
	#	elif vidas == 0:
	#		get_tree().get_current_scene().get_node("./vidas/vida1").hide()
	#		get_tree().set_pause(true)
		#when the game ends and we have to show the pontuation
		#	get_tree().get_current_scene().get_node("gerados").hide()
	#		get_tree().get_current_scene().get_node("./Painel_Game_Over/lblTempo").set_text(str(time))
	#		get_tree().get_current_scene().get_node("./Painel_Game_Over/lblPontuacao").set_text(str(pontuacao))
	#		get_tree().get_current_scene().get_node("./Painel_Game_Over").show()
	#		vidas = 3
		
			
					#if the pontuation is bigger than 100, the Phase2 button is shown
			var pont =  get_tree().get_current_scene().get_node("./Painel_Game_Over/lblPontuacao").get_text().to_int() 
			if pont>=100:
				get_tree().get_current_scene().get_node("./Painel_Game_Over/btFase2").show()
				get_tree().get_current_scene().get_node("./Painel_Game_Over/btRecomecar").show()
	
		#to create new bags
			#var bag_instance = bag
			#get_tree().get_current_scene().get_node("gerados").add_child(bag_instance)
			#bag_instance.set_pos(Vector2(rand_range(0,600), rand_range(150,400)))
			print("Saco criado")
			
			
		#to create new bananas
			#var banana_instance = banana
			#add_child(banana_instance)
			#banana_instance.set_pos(Vector2(rand_range(0,600), rand_range(150,400)))
			#banana_instance.is_visible(true)
		#to create new apple
			#var maca_instance = maca
			#add_child(maca_instance)
			#maca_instance.set_pos(Vector2(rand_range(0,600), rand_range(150,400)))
			
		#to create new glasses
			#var vidro = glass
			#add_child(vidro)
			#vidro.set_pos(Vector2(rand_range(0,600), rand_range(150,400)))





func _button_pressed():			#to pause  the game
	get_tree().set_pause(true)
	get_tree().get_current_scene().get_node("./PauseMenu/btPlay").show()
	get_tree().get_current_scene().get_node("./PauseMenu/btPause").hide()
	
func _button_play_pressed():	#to restart the game
	get_tree().set_pause(false)
	get_tree().get_current_scene().get_node("./PauseMenu/btPlay").hide()
	get_tree().get_current_scene().get_node("./PauseMenu/btPause").show()
	
func _button_Recomecar_pressed():			
	#to play again when the phase ends, reset lives and pontuation
	get_tree().get_current_scene().get_node("./Painel_Game_Over").hide()
	get_tree().set_pause(false)
	get_tree().get_current_scene().get_node("gerados").show()
	get_tree().get_current_scene().get_node("./vidas/vida3").show()
	get_tree().get_current_scene().get_node("./vidas/vida2").show()
	get_tree().get_current_scene().get_node("./vidas/vida1").show()
	get_tree().get_current_scene().get_node("./pontuacao/Pontos").set_text(str(0))

func _button_continuar_painel_informacoes_pressed():
	get_tree().set_pause(false)
	get_node("Painel_Informacoes").hide()
	
func _button_Fase2_pressed():
	get_tree().change_scene("res://Scenes/Fase2.scn")
	get_tree().get_current_scene().get_node("./Painel_Game_Over").hide()


func _on_Timerbarris_timeout():
	var barril_instance = barril.instance()
	get_node("gerados").add_child(barril_instance)
	barril_instance.set_pos(Vector2(rand_range(0,600), rand_range(150,400)))
	
	var banana = get_node("banana").duplicate(true)
	get_node(".").add_child(banana)
	banana.set_pos(Vector2(100,200))



func _on_TimerVidros_timeout():
	var vidro_instance = glass.instance()
	get_node("gerados").add_child(vidro_instance)
	vidro_instance.set_pos(Vector2(rand_range(0,600), 5))
	
func _on_Timerbags_timeout():
	pass # replace with function body


func _on_Timerbananas_timeout():
	pass # replace with function body
