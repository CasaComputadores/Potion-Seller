extends Node2D

func _on_area_2d_area_entered(area: Area2D) -> void:
	print("Objeto entrou:", area.name)
	if area.is_in_group("pocoes"):
		var parent = area.get_parent()
		if parent:
			parent.queue_free()
			print("Poção Vendida:", parent.name)
