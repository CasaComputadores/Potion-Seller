extends Node

var volume_value: float = -10
var tocando = false

func iniciar_volume():
	var bgmusic_bus = AudioServer.get_bus_index("BGMusic")
	AudioServer.set_bus_volume_db(bgmusic_bus, volume_value)
	AudioServer.set_bus_mute(bgmusic_bus, volume_value == -30)

func set_volume():
	var bgmusic_bus = AudioServer.get_bus_index("BGMusic")
	AudioServer.set_bus_volume_db(bgmusic_bus, volume_value)
	AudioServer.set_bus_mute(bgmusic_bus, volume_value == -30)
	
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
