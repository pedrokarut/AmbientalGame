extends Node2D


var vidro = preload("res://Scenes/glass.scn")
var  barril = preload("res://Scenes/barril_explosivo.scn")
var bag = preload("res://Scenes/bag.scn")
var banana = preload("res://Scenes/casca_banana.scn")
var maca = preload("res://Scenes/maça.scn")
var vidas

var time = 0					#to save the game's time


func _ready():
	
	get_node("Painel_Informacoes").show()
	set_process(true)
	

func _process(delta):
	
	time = time + delta
	vidas = get_node("SuitMan/vidas")
	
	get_node("pontuacao/Pontos").set_text(get_node("SuitMan/pontuacao").get_text())
	
		#to check the quantity of lives
	if vidas.get_text().to_int() == 2:
		get_node("vidas/vida3").hide()

	elif vidas.get_text().to_int() == 1:
		get_node("vidas/vida2").hide()
	
	elif vidas.get_text().to_int() == 0:
		get_node("vidas/vida1").hide()
		get_tree().set_pause(true)
		#when the game ends and we have to show the pontuation
		get_node("gerados").hide()
		get_node("Painel_Game_Over/lblTempo").set_text(str(time))
		get_node("Painel_Game_Over/lblPontuacao").set_text(get_node("SuitMan/pontuacao").get_text())
		get_node("Painel_Game_Over").show()
		
		#if the pontuation is bigger than 100, the Phase2 button is shown
		var pont =  get_node("pontuacao/Pontos").get_text().to_int() 
		if pont>=200:
			get_node("Painel_Game_Over/btFase2").show()
			get_node("Painel_Game_Over/btRecomecar").hide()


func _button_pressed():			#to pause  the game
	get_tree().set_pause(true)
	get_node("PauseMenu/btPlay").show()
	get_node("PauseMenu/btPause").hide()
	
func _button_play_pressed():	#to restart the game
	get_tree().set_pause(false)
	get_node("./PauseMenu/btPlay").hide()
	get_node("PauseMenu/btPause").show()
	
func _button_Recomecar_pressed():			
	#to play again when the phase ends, reset lives and pontuation
	get_node("Painel_Game_Over").hide()
	get_tree().set_pause(false)
	get_node("gerados").show()
	get_node("vidas/vida3").show()
	get_node("vidas/vida2").show()
	get_node("vidas/vida1").show()
	get_node("pontuacao/Pontos").set_text(str(0))
	get_node("SuitMan/vidas").set_text(str(3))
	get_node("pontuacao/Pontos").set_text(str(0))
	get_tree().reload_current_scene()

func _button_continuar_painel_informacoes_pressed():
	get_tree().set_pause(false)
	get_node("Painel_Informacoes").hide()

	
func _button_Fase2_pressed():
	get_tree().change_scene("res://Scenes/Fase2.scn")
	get_tree().get_current_scene().get_node("./Painel_Game_Over").hide()


func _on_Timerbarris_timeout():
		var barril_instance = barril.instance()
		get_node("gerados").add_child(barril_instance)
		barril_instance.set_pos(Vector2(rand_range(0,600), 5))
	
func _on_TimerVidros_timeout():
		var vidro_instance = vidro.instance()
		get_node("gerados").add_child(vidro_instance)
		vidro_instance.set_pos(Vector2(rand_range(0,600), rand_range(150,400)))
		
func _on_Timerbags_timeout():
		var bag_instance = bag.instance()
		get_node("gerados").add_child(bag_instance)
		bag_instance.set_pos(Vector2(rand_range(0,600), rand_range(150,400)))


func _on_Timerbananas_timeout():
		var banana_instance = banana.instance()
		get_node("gerados").add_child(banana_instance)
		banana_instance.set_pos(Vector2(rand_range(0,600), rand_range(150,400)))


func _on_TimerMaas_timeout():
	var maca_instance = maca.instance()
	get_node("gerados").add_child(maca_instance)
	maca_instance.set_pos(Vector2(rand_range(0,600), rand_range(150,400)))
