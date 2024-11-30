extends Area2D

@export var pocao_verde: PackedScene
@export var pocao_vermelha: PackedScene
@export var pocao_rosa: PackedScene
@export var pocao_azul: PackedScene
@export var pocao_amarela: PackedScene

@export var pocao_verde_media: PackedScene
@export var pocao_vermelha_media: PackedScene
@export var pocao_rosa_media: PackedScene
@export var pocao_azul_media: PackedScene
@export var pocao_amarela_media: PackedScene

@export var pocao_verde_pequena: PackedScene
@export var pocao_vermelha_pequena: PackedScene
@export var pocao_rosa_pequena: PackedScene
@export var pocao_azul_pequena: PackedScene
@export var pocao_amarela_pequena: PackedScene

@export var botao_criar_scene: PackedScene

var ingredientes_no_caldeirao: Array = []
var botao_criar: Button

func _ready() -> void:
	ingredientes_no_caldeirao.clear()
	if botao_criar:
		botao_criar.queue_free()
		botao_criar = null

func _on_area_entered(area: Area2D) -> void:
	if Global.verifica_quantidade_pocao(): #verifica se a quantidade de poção pode 
		print("Objeto entrou:", area.name)
		
		if area.is_in_group("ingredientes"):
			var parent = area.get_parent()
			
			if parent:
				# Identifica qual ingrediente foi adicionado
				var ingrediente_nome = parent.name
				ingredientes_no_caldeirao.append(ingrediente_nome)
				parent.queue_free()
				print("Ingrediente armazenado:", ingrediente_nome)
			if not botao_criar:
				gerar_botao_criar()

func gerar_botao_criar() -> void:
	if botao_criar_scene:
		# Instancia o botão a partir da cena
		var botao_instance = botao_criar_scene.instantiate() as Button
		
		# Configura o ancoramento do botão
		botao_instance.anchor_left = 0.7
		botao_instance.anchor_top = 0.9
		botao_instance.anchor_bottom = 1.0
		
		# Conecta o sinal "pressed" ao método de criação da poção
		botao_instance.pressed.connect(_on_criar_pocao)
		
		# Adiciona o botão à árvore de nós
		get_tree().root.add_child(botao_instance)
		
		# Armazena a referência para futura remoção
		botao_criar = botao_instance

func _on_criar_pocao() -> void:
	if ingredientes_no_caldeirao.size() > 0: 
		print("Ingredientes no caldeirão:", ingredientes_no_caldeirao)
		var contagem = {}
		for ingrediente in ingredientes_no_caldeirao:
			contagem[ingrediente] = contagem.get(ingrediente, 0) + 1
		print("Contagem dos ingredientes:", contagem)
		
		print(contagem)
		
		var mais_frequente = ""
		var maior_quantidade = 0
		var tanto_ingrediente = 0
		for ingrediente in contagem.keys():
			tanto_ingrediente += contagem[ingrediente]
			print(tanto_ingrediente)
			if contagem[ingrediente] > maior_quantidade:
				mais_frequente = ingrediente
				maior_quantidade = contagem[ingrediente]
		
		var quantidade_para_mist_pequena = 1
		var quantidade_para_mist_media = 2
		print("Ingrediente mais frequente:", mais_frequente)
		var pocao: PackedScene
		match mais_frequente:
			"erva":
				if tanto_ingrediente == quantidade_para_mist_pequena:
					pocao = pocao_verde_pequena
				elif tanto_ingrediente == quantidade_para_mist_media:
					pocao = pocao_verde_media
				else:
					pocao = pocao_verde
				
			"coracao":
				if tanto_ingrediente == quantidade_para_mist_pequena:
					pocao = pocao_vermelha_pequena
				elif tanto_ingrediente == quantidade_para_mist_media:
					pocao = pocao_vermelha_media
				else:
					pocao = pocao_vermelha
					
			"ametista":
				if tanto_ingrediente == quantidade_para_mist_pequena:
					pocao = pocao_rosa_pequena
				elif tanto_ingrediente == quantidade_para_mist_media:
					pocao = pocao_rosa_media
				else:
					pocao = pocao_rosa
					
			"flor":
				if tanto_ingrediente == quantidade_para_mist_pequena:
					pocao = pocao_amarela_pequena
				elif tanto_ingrediente == quantidade_para_mist_media:
					pocao = pocao_amarela_media
				else:
					pocao = pocao_amarela
			"po_magico":
				if tanto_ingrediente == quantidade_para_mist_pequena:
					pocao = pocao_azul_pequena
				elif tanto_ingrediente == quantidade_para_mist_media:
					pocao = pocao_azul_media
				else:
					pocao = pocao_azul
		Global.aumenta_quantidade_pocao() #aumenta o numero global da pot
		#verifica se poção existe
		if pocao:
			print("Instanciando poção:", pocao)
			var instancia_pocao = pocao.instantiate()
			instancia_pocao.global_position = self.global_position
			get_tree().root.add_child(instancia_pocao)
			print("Poção criada com sucesso!")
		
		for ingrediente in contagem:
			if ingrediente in contagem and contagem[ingrediente]:
				match ingrediente:
					"erva":
						Global.decrementar_ervas(contagem[ingrediente])
					"flor":
						Global.decrementar_flores(contagem[ingrediente])
					"ametista":
						Global.decrementar_ametista(contagem[ingrediente])
					"coracao":
						Global.decrementar_coracao(contagem[ingrediente])
					"po_magico":
						Global.decrementar_po(contagem[ingrediente])
						
				
		ingredientes_no_caldeirao.clear()
		if botao_criar:
			botao_criar.queue_free()
			botao_criar = null
	else:
		print("Nenhum ingrediente no caldeirão!")
