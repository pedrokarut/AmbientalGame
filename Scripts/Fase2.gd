extends Node2D

var lixos
var time = 0
var bag = preload("res://Scenes/Fase2/bag.scn")
var bottle = preload("res://Scenes/Fase2/bottle.scn")
var vidro = preload("res://Scenes/Fase2/glass.scn")
var lata = preload("res://Scenes/Fase2/can.scn")
var maca = preload("res://Scenes/Fase2/apple.scn")
var banana = preload("res://Scenes/Fase2/casca_banana.scn")
var waterBottle = preload("res://Scenes/waterBottle.scn")
var paper = preload("res://Scenes/paperStack.scn")
var anim
var corretos = 0
var errados = 0
var lblcertos 
var lblerrados
var lblchances
var chances = 10

func _ready():
	get_tree().set_pause(false)
	anim = get_node("AlienAnimation/AnimationPlayer")
	anim.play("abdução")
	lixos = get_node("Alien/lixos")
	lblcertos  = get_node("MenuLateral/lblCertos")
	lblerrados = get_node("MenuLateral/lblErrados")
	lblchances = get_node("MenuLateral/lblChances")
	
func _process(delta):
	time = time + delta
	
	if chances == 0:
		get_tree().set_pause(true)
		get_node("GameOver/lblCertos").set_text(str(corretos))
		get_node("GameOver/lblErrados").set_text(str(errados))
		get_node("GameOver/lblTempo").set_text(str(time))
		get_node("GameOver").show()


func _remove_animation():
	get_node("lixos").hide()
	get_node("AlienAnimation").hide()
	get_node("Raio").hide()
	get_tree().set_pause(true)
	get_node("InfoFase2").show()
	
	
#here there are all the timers that make the trash fall one by one at each time 
#this code get the alien position and then put the trash at that position 
func _timer_papel():
	var paper_instance = paper.instance()
	lixos.add_child(paper_instance)
	paper_instance.set_pos(Vector2(get_node("Alien/Sprite").get_pos().x, 0))


func _Timergua():
	var water_instance = waterBottle.instance()
	lixos.add_child(water_instance)
	water_instance.set_pos(Vector2(get_node("Alien/Sprite").get_pos().x, 0))


func _TimerBanana():
	var banana_instance = banana.instance()
	lixos.add_child(banana_instance)
	banana_instance.set_pos(Vector2(get_node("Alien/Sprite").get_pos().x, 0))


func _TimerMaca():
	var maca_instance = maca.instance()
	lixos.add_child(maca_instance)
	maca_instance.set_pos(Vector2(get_node("Alien/Sprite").get_pos().x, 0))


func _TimerGarrafa_():
	var garrafa_instance = bottle.instance()
	lixos.add_child(garrafa_instance)
	garrafa_instance.set_pos(Vector2(get_node("Alien/Sprite").get_pos().x, 0))	


func _TimerVidro():
	var vidro_instance = vidro.instance()
	lixos.add_child(vidro_instance)
	vidro_instance.set_pos(Vector2(get_node("Alien/Sprite").get_pos().x, 0))

func _TimerLata():
	var lata_instance = lata.instance()
	lixos.add_child(lata_instance)
	lata_instance.set_pos(Vector2(get_node("Alien/Sprite").get_pos().x, 0))

func _TimerBag():
	var bag_instance = bag.instance()
	lixos.add_child(bag_instance)
	bag_instance.set_pos(Vector2(get_node("Alien/Sprite").get_pos().x, 0))




#here it is the code that checks whats is entering at the trash barrels so taht 
#we can say if it is right or not

func _on_Plastico_area_enter( area ):
	var nome = area.get_parent().get_name()
	if "waterBottle" in nome or "bottle" in nome:
		area.get_parent().queue_free()
		corretos += 1
		get_node("Caminhao/Plastico/OkWrong").show()
		get_node("Caminhao/Plastico/OkWrong/AnimationPlayer").play("ok")
		lblcertos.set_text(str(corretos))
	else:
		get_node("Caminhao/Plastico/OkWrong").show()
		get_node("Caminhao/Plastico/OkWrong/AnimationPlayer").play("wrong")
		area.get_parent().queue_free()
		errados += 1
		chances -= 1
		lblerrados.set_text(str(errados))
		lblchances.set_text(str(chances))
		

func _on_Papel_area_enter( area ):
	var nome = area.get_parent().get_name()
	if "bag" in nome or "Paper" in nome:
		area.get_parent().queue_free()
		corretos += 1
		get_node("Caminhao/Papel/OkWrong").show()
		get_node("Caminhao/Papel/OkWrong/AnimationPlayer").play("ok")
		lblcertos.set_text(str(corretos))
	else:
		get_node("Caminhao/Papel/OkWrong").show()
		get_node("Caminhao/Papel/OkWrong/AnimationPlayer").play("wrong")
		area.get_parent().queue_free()
		errados += 1
		chances -= 1
		lblerrados.set_text(str(errados))
		lblchances.set_text(str(chances))


func _on_Vidro_area_enter( area ):
	var nome = area.get_parent().get_name()
	if "vidro" in nome:
		area.get_parent().queue_free()
		corretos += 1
		get_node("Caminhao/Vidro/OkWrong").show()
		get_node("Caminhao/Vidro/OkWrong/AnimationPlayer").play("ok")
		lblcertos.set_text(str(corretos))
	else:
		get_node("Caminhao/Vidro/OkWrong").show()
		get_node("Caminhao/Vidro/OkWrong/AnimationPlayer").play("wrong")
		area.get_parent().queue_free()
		errados += 1
		chances -= 1
		lblerrados.set_text(str(errados))
		lblchances.set_text(str(chances))


func _on_Organico_area_enter( area ):
	var nome = area.get_parent().get_name()
	if "apple" in nome or "banana" in nome:
		area.get_parent().queue_free()
		corretos += 1
		get_node("Caminhao/Organico/OkWrong").show()
		get_node("Caminhao/Organico/OkWrong/AnimationPlayer").play("ok")
		lblcertos.set_text(str(corretos))
	else:
		get_node("Caminhao/Organico/OkWrong").show()
		get_node("Caminhao/Organico/OkWrong/AnimationPlayer").play("wrong")
		area.get_parent().queue_free()
		errados += 1
		chances -= 1
		lblerrados.set_text(str(errados))
		lblchances.set_text(str(chances))


func _on_Metal_area_enter( area ):
	var nome = area.get_parent().get_name()
	if "lata" in nome:
		area.get_parent().queue_free()
		corretos += 1
		get_node("Caminhao/Metal/OkWrong").show()
		get_node("Caminhao/Metal/OkWrong/AnimationPlayer").play("ok")
		lblcertos.set_text(str(corretos))
	else:
		get_node("Caminhao/Metal/OkWrong").show()
		get_node("Caminhao/Metal/OkWrong/AnimationPlayer").play("wrong")
		area.get_parent().queue_free()
		errados += 1
		chances -= 1
		lblerrados.set_text(str(errados))
		lblchances.set_text(str(chances))


func _on_killer_area_enter( area ):
	area.get_parent().queue_free()
	errados += 1
	chances -= 1
	lblerrados.set_text(str(errados))
	lblchances.set_text(str(chances))

func _on_ButtonContinuar_pressed():
	get_node("InfoFase2").hide()
	get_node("InfoFaseTiposLixo").show()

func _on_ButtonJogar_pressed():
	get_node("Alien").show()
	get_node("Alien/Sprite/AnimationPlayer").play("movimentação")
	get_node("Timers/TimerPapel").start()
	get_node("Timers/TimerÁgua").start()
	get_node("Timers/TimerBanana").start()
	get_node("Timers/TimerMaça").start()
	get_node("Timers/TimerGarrafa").start()
	get_node("Timers/TimerVidro").start()
	get_node("Timers/TimerLata").start()
	get_node("Timers/TimerBag").start()
	get_node("Caminhao").show()
	get_node("InfoFaseTiposLixo").hide()
	get_node("MenuLateral").show()
	get_tree().set_pause(false)
	set_process(true)


func _on_btPause_pressed():
	get_tree().set_pause(true)
	get_node("MenuLateral/btPause").hide()
	get_node("MenuLateral/btPlay").show()

func _on_btPlay_pressed():
	get_tree().set_pause(false)
	get_node("MenuLateral/btPause").show()
	get_node("MenuLateral/btPlay").hide()

func _on_ButtonInicio_pressed():
	get_tree().change_scene("res://Scenes/interface.scn")