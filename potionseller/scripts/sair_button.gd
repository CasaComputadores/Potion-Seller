extends Button

func _on_pressed() -> void:
	await get_tree().create_timer(0.2).timeout
	get_tree().quit()
