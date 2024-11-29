extends Area2D

@export var pocao_verde: PackedScene
@export var pocao_vermelha: PackedScene
@export var pocao_rosa: PackedScene
@export var pocao_azul: PackedScene
@export var pocao_amarela: PackedScene

var ingredientes_no_caldeirao: Array = []
var botao_criar: Button

func _ready() -> void:
	ingredientes_no_caldeirao.clear()
	if botao_criar:
		botao_criar.queue_free()
		botao_criar = null

func _on_area_entered(area: Area2D) -> void:
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
	botao_criar = Button.new()
	botao_criar.text = "Criar"
	botao_criar.anchor_left = 0.4
	botao_criar.anchor_right = 0.6
	botao_criar.anchor_top = 0.9
	botao_criar.anchor_bottom = 1.0
	botao_criar.pressed.connect(_on_criar_pocao)
	get_tree().root.add_child(botao_criar)

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
		for ingrediente in contagem.keys():
			if contagem[ingrediente] > maior_quantidade:
				mais_frequente = ingrediente
				maior_quantidade = contagem[ingrediente]
		print("Ingrediente mais frequente:", mais_frequente)
		var pocao: PackedScene
		match mais_frequente:
			"erva":
				pocao = pocao_verde
			"coracao":
				pocao = pocao_vermelha
			"ametista":
				pocao = pocao_rosa
			"flor":
				pocao = pocao_amarela
			"po_magico":
				pocao = pocao_azul

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
