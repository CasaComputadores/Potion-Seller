extends Area2D

@export var erva_ingrediente: PackedScene

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	# Verifica se o evento foi um clique (botão do mouse pressionado)
	if event is InputEventMouseButton and event.pressed:
		if Global.pode_criar_erva():
			if erva_ingrediente:  # Certifica-se de que a cena foi atribuída
				# Instancia o ingrediente
				var instancia_erva = erva_ingrediente.instantiate()
				# Define a posição global para ser igual à do objeto atual
				instancia_erva.global_position = self.global_position
				# Adiciona o ingrediente à árvore de nós
				get_tree().root.add_child(instancia_erva)
				# Incrementa o contador de ervas globalmente
				Global.incrementar_ervas()
				print("Ervas criadas:", Global.ervas_criadas)
		else:
			print("Limite de ervas atingido!")
