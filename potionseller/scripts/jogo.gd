extends Node2D

@onready var escmenu = $Window
@onready var ingrediente = preload("res://cenas/erva.tscn")
@onready var hud = $HUD/Moeda
@onready var hudIngredientes = $HUD2/Ingredientes
@onready var areaNPC = $AreaNPC
@onready var boneco_instanciado = null

func _ready():
	MusicaMenu.tocar()
	print("toca essa bosta logo")
	if Global.npc == 0:
		var jogo = get_tree().current_scene
		Global.cenaJogo = jogo
		print("nó corrigido", Global.cenaJogo)
		Global.instantiate_random_scene(Global.cenaJogo, areaNPC)
		Global.npc = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Esc"):
		escmenu.show()
	hud.text = "%d" % Global.contador_moeda
	hudIngredientes.text = "%d/3" % Global.maxIngredientesCaldeirao
	
		
func desinstanciarNPC():
	# Verifica os filhos e identifica qual boneco foi instanciado
	for child in get_children():
		print("coisa: ", child.get_parent())
		print("quem é: ", child)
		if child.name == "boneco1" or child.name == "boneco2" or child.name == "boneco3":
			boneco_instanciado = child
			print("boneco vagabundo: ", boneco_instanciado)
			break

	if boneco_instanciado:
		boneco_instanciado.queue_free()
		Global.npc = 0
		print("sai fora boneco instanciado!!!")

func _on_window_close_requested() -> void:
	escmenu.hide()


func _on_voltar_button_tirar_boneco_signal() -> void:
	emit_signal("sair")
