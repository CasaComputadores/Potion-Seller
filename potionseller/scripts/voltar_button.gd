extends Button

@onready var hover = preload("res://cenas/musicas/hover.tscn")
@onready var click = preload("res://cenas/musicas/click.tscn")

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/menu.tscn")
	var click_sound = click.instantiate()
	add_child(click_sound)
	click_sound.play()

func _on_mouse_entered() -> void:
	var hover_sound = hover.instantiate()
	add_child(hover_sound)
	hover_sound.play()
