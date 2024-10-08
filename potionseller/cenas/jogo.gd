extends Node2D

@onready var escmenu = $Window
@onready var ingrediente = preload("res://cenas/ingrediente.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Esc"):
		escmenu.show()
	if Input.is_action_just_pressed("Criar Objeto"):
		var ingrediente = ingrediente.instantiate()
		add_child(ingrediente)
		ingrediente.global_position = get_global_mouse_position()


func _on_window_close_requested() -> void:
	escmenu.hide()
