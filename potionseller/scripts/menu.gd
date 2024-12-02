extends Node2D

@onready var hover_sound_scene = preload("res://cenas/musicas/hover.tscn")
@onready var click_sound_scene = preload("res://cenas/musicas/click.tscn")
@onready var cave_sound_scene = preload("res://cenas/musicas/cave_sound.tscn")

func _ready() -> void:
	if not Global.musicaInicialResetada:
		inicVolume()
		MusicaInicial.tocar()
		Global.musicaInicialResetada = true

func inicVolume():
	if Global.musicaInicial:
		print("naopode mudaradfadf")
	else:
		MusicaMenu.iniciar_volume()
		MusicaInicial.iniciar_volume()
		Global.musicaInicial = true

func _on_jogar_button_mouse_entered() -> void:
	var hover_sound = hover_sound_scene.instantiate()
	add_child(hover_sound)
	hover_sound.play()

func _on_jogar_button_pressed() -> void:
	var cave_sound = cave_sound_scene.instantiate()
	add_child(cave_sound)
	cave_sound.play()
 
func _on_opcoes_button_mouse_entered() -> void:
	var hover_sound = hover_sound_scene.instantiate()
	add_child(hover_sound)
	hover_sound.play()

func _on_opcoes_button_pressed() -> void:
	var click_sound = click_sound_scene.instantiate()
	add_child(click_sound)
	click_sound.play()

func _on_sair_button_mouse_entered() -> void:
	var hover_sound = hover_sound_scene.instantiate()
	add_child(hover_sound)
	hover_sound.play()

func _on_sair_button_pressed() -> void:
	var click_sound = click_sound_scene.instantiate()
	add_child(click_sound)
	click_sound.play()
