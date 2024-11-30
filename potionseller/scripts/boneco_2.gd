extends Node2D

@onready var areaMoeda = $"/root/Jogo/Area2D"
@onready var areaNPC = $"/root/Jogo/AreaNPC"
@export var moedaDourada: PackedScene

func _on_area_2d_area_entered(area: Area2D) -> void:
	print("Objeto entrou:", area.name)
	if area.is_in_group("pocoes"):
		Global.diminuir_quantidade_pocao() #diminuindo a quantidade de pot global
		var parent = area.get_parent() 
		if parent:
			if moedaDourada:
				var moeda = moedaDourada.instantiate()
				print("Moeda instanciada:", moeda)
				
				print("caminho da areaMoeda: ", areaMoeda.get_path())
				
				# Posiciona a moeda com base na posição global convertida para o local do nó 'areaMoeda'
				moeda.position = areaMoeda.global_position

				# Adiciona a moeda diretamente à árvore de nós principal (ou qualquer nó desejado)
				get_tree().root.add_child(moeda)  # Ou get_tree().current_scene.add_child(moeda) se preferir

				print("Moeda posicionada em:", moeda.position)
				parent.queue_free()
				print("Poção Vendida e moeda criada:", parent.name)

				# Aguarda 1 segundo e depois remove o boneco
				await get_tree().create_timer(1.0).timeout
				
				Global.instantiate_random_scene(get_tree().root, areaNPC)
				
				# Remove o boneco
				queue_free()
				
				
			else:
				print("Erro: moedaDourada não está configurada ou carregada.")
