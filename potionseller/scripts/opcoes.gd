extends Node2D

func _ready() -> void:
	# Obtém o slider e ajusta seu valor com base no volume global armazenado
	var slider = $VBoxContainer/VolumeMusica  # Substitua "Slider" pelo caminho correto
	slider.value = MusicaMenu.volume_value  # Usa o valor global do Autoload
	MusicaMenu.set_volume()  # Aplica o volume ao iniciar a cena de opções

func _on_volume_musica_value_changed(value: float) -> void:
	# Atualiza o volume global e aplica as mudanças
	MusicaMenu.volume_value = value
	MusicaMenu.set_volume()
