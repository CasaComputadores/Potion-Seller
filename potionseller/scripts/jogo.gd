extends Node2D

@onready var escmenu = $Window
@onready var ingrediente = preload("res://cenas/erva.tscn")
@onready var hud = $HUD/Moeda
@onready var areaNPC = $AreaNPC

func _ready():
	MusicaMenu.tocar()
	print("toca essa bosta logo")
	if Global.npc == 0:
		Global.instantiate_random_scene(get_tree().root, areaNPC)
		Global.npc = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Esc"):
		escmenu.show()
	hud.text = "%d" % Global.contador_moeda

func _on_window_close_requested() -> void:
	escmenu.hide()


func _on_voltar_button_tirar_boneco_signal() -> void:
	emit_signal("sair")
