extends Area2D




func _on_area_entered(area: Area2D) -> void:
	print("Objeto entrou:", area.name)
	
	if area.is_in_group("moedas"):
		area.get_parent().queue_free()
		Global.contador_moeda += 1
		print("moeda botada", Global.contador_moeda)
