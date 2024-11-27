extends Node2D

@onready var hover_sound_scene = preload("res://cenas/musicas/hover.tscn")
@onready var click_sound_scene = preload("res://cenas/musicas/click.tscn")

func _on_volume_geral_value_changed(value: float) -> void:
	var master_bus = AudioServer.get_bus_index("Master")
	var volume_value = value
	AudioServer.set_bus_volume_db(master_bus, volume_value)
	AudioServer.set_bus_mute(master_bus, volume_value == -30)

func _on_volume_musica_value_changed(value: float) -> void:
	MusicaMenu.volume_value = value
	MusicaMenu.set_volume()

func _on_volume_sfx_value_changed(value: float) -> void:
	var sfx_bus = AudioServer.get_bus_index("SFX")
	var volume_value = value
	AudioServer.set_bus_volume_db(sfx_bus, volume_value)
	AudioServer.set_bus_mute(sfx_bus, volume_value == -30)
	
func _ready() -> void:
	var sliderMusica = $VBoxContainer/VolumeMusica
	sliderMusica.value = MusicaMenu.volume_value
	MusicaMenu.set_volume()
	
	for button in get_children():
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
