extends Area2D

@export var ametista_ingrediente: PackedScene

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	# Verifica se o evento foi um clique (botão do mouse pressionado)
	if event is InputEventMouseButton and event.pressed:
		if Global.pode_criar_ametista():
			if ametista_ingrediente:  # Certifica-se de que a cena foi atribuída
				# Instancia o ingrediente
				var instancia_ametista = ametista_ingrediente.instantiate()
				# Define a posição global para ser igual à do objeto atual
				instancia_ametista.global_position = event.position
				# Adiciona o ingrediente à árvore de nós
				get_tree().root.add_child(instancia_ametista)
				# Incrementa o contador de ervas globalmente
				Global.incrementar_ametista()
				print("Ervas criadas:", Global.flores_criadas)
		else:
			print("Limite de ervas atingido!")
