extends Node2D

@onready var hover_sound_scene = preload("res://cenas/musicas/hover.tscn")
@onready var click_sound_scene = preload("res://cenas/musicas/click.tscn")

func _ready() -> void:
	# Configura o volume inicial com base no Autoload
	MusicaMenu.set_volume()
	
	var container = $VBoxContainer
	for button in container.get_children():
		if button is Button:
			button.connect("mouse_entered", Callable(self, "_on_button_mouse_entered"))
			button.connect("pressed", Callable(self, "_on_button_pressed"))

func _on_button_mouse_entered():
	var hover_sound = hover_sound_scene.instantiate()
	add_child(hover_sound)
	hover_sound.play()

func _on_button_pressed():
	var click_sound = click_sound_scene.instantiate()
	add_child(click_sound)
	click_sound.play()
