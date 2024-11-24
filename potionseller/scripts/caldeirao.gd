extends Area2D

# Caminho da cena da poção
@export var pocao_scene: PackedScene

func _on_area_entered(area: Area2D) -> void:
	print("Objeto entrou:", area.name)
	
	# Verifica se o nó pertence ao grupo "ingredientes"
	if area.is_in_group("ingredientes"):
		# Obtem o nó raiz do ingrediente e o remove
		var parent = area.get_parent()
		if parent:
			parent.queue_free()
			print("Ingrediente detectado e removido:", parent.name)
		
		# Cria e posiciona a poção no local do caldeirão
		var pocao = pocao_scene.instantiate()
		pocao.global_position = self.global_position
		get_tree().root.add_child(pocao)
		print("Poção criada!")
