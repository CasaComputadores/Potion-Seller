extends Node2D

@onready var escmenu = $Window
@onready var ingrediente = preload("res://cenas/erva.tscn")
@onready var hud = $HUD/Moeda

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Esc"):
		escmenu.show()
	hud.text = "%d" % Global.contador_moeda

func _on_window_close_requested() -> void:
	escmenu.hide()
