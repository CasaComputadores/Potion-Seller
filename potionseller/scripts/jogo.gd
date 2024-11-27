extends Node2D

@onready var escmenu = $Window
@onready var ingrediente = preload("res://cenas/erva.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Esc"):
		escmenu.show()

func _on_window_close_requested() -> void:
	escmenu.hide()
