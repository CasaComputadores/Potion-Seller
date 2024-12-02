extends Button

func _on_pressed() -> void:
	TransitionScreen.transition()
	MusicaInicial.parar()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://cenas/jogo.tscn")
