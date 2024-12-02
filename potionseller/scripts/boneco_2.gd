extends Node2D

@onready var areaMoeda = $"/root/Jogo/Area2D"
@onready var areaNPC = $"/root/Jogo/AreaNPC"
@onready var balao = $BalaoPocao
@export var moedaDourada: PackedScene
signal sair

func _ready():
	balao.show_balloon()
	print("chamando o balao")

func _on_remover_npc():
	print("SAI FORA MEU")
	queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	print("Objeto entrou:", area.name)

	if area.is_in_group("pocoes"):
		Global.diminuir_quantidade_pocao() # Diminuindo a quantidade de poção global

		var parent = area.get_parent()

		if parent and parent is Sprite2D:  # Verifique se o parent é do tipo Sprite2D
			var parent_texture = parent.texture  # Obtenha a textura do Sprite2D
			var delivered_texture = balao.getPocao()  # Textura esperada
			print("delivered: ", delivered_texture)
			print("parent texture: ", parent_texture)
			
			# Comparar a textura entregue com a selecionada
			if delivered_texture == parent_texture:
				print("Poção correta!")
				
				parent.queue_free()
				print("Poção Vendida e moeda criada:", parent.name)
				
				await get_tree().create_timer(0.5).timeout

				var moeda = moedaDourada.instantiate()
				print("Moeda instanciada:", moeda)

				# Posiciona a moeda com base na posição global convertida para o local do nó 'areaMoeda'
				moeda.position = areaMoeda.global_position

				# Adiciona a moeda diretamente à árvore de nós principal (ou qualquer nó desejado)
				get_tree().root.add_child(moeda)  # Ou get_tree().current_scene.add_child(moeda) se preferir
				SomMoeda.play()

				print("Moeda posicionada em:", moeda.position)

				# Aguarda 1 segundo e depois remove o boneco
				await get_tree().create_timer(1.0).timeout

				Global.instantiate_random_scene(get_tree().root, areaNPC)

				# Remove o boneco
				queue_free()

			else:
				print("pocao errada bosta")
				
				parent.queue_free()
				
				await get_tree().create_timer(0.3).timeout
				
				WrongSoundEffect.play()

				# Aguarda 1 segundo e depois remove o boneco
				await get_tree().create_timer(0.7).timeout

				Global.instantiate_random_scene(Global.cenaJogo, areaNPC)

				# Remove o boneco
				queue_free()


func _on_sair() -> void:
	queue_free()
