extends Node

var tocando = false

func iniciar_volume():
	var valueInicial: float = -10
	var bgmusic_bus = AudioServer.get_bus_index("BGMusic")
	AudioServer.set_bus_volume_db(bgmusic_bus, valueInicial)
	AudioServer.set_bus_mute(bgmusic_bus, valueInicial == -30)

func set_volume():
	var valueInicial: float = -10
	var bgmusic_bus = AudioServer.get_bus_index("BGMusic")
	AudioServer.set_bus_volume_db(bgmusic_bus, valueInicial)
	AudioServer.set_bus_mute(bgmusic_bus, valueInicial == -30)
	
func tocar() -> void:
	var music_player = $"."
	if music_player.stream and music_player.stream is AudioStream:
		music_player.stream.set_loop(true)
	music_player.play()
	tocando = true

func parar():
	var music_player = $"."
	music_player.stop()
	tocando = false
