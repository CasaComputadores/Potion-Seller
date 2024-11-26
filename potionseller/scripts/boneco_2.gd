extends Node2D
#var coin = 0;
@onready var hud = $HUD/Moeda
@export var moedaDourada : PackedScene
var contadorMoeda: int = 0
func _on_area_2d_area_entered(area: Area2D) -> void:
	print("Objeto entrou:", area.name)
	if area.is_in_group("pocoes"):
		var parent = area.get_parent()
		if parent:
			coletarMoeda()
			if moedaDourada:
				var moeda = moedaDourada.instantiate()
				print("Moeda instanciada:", moeda)
				add_child(moeda) # Adiciona a moeda à cena atual
				moeda.position = parent.position # Posiciona a moeda no lugar do objeto coletado
				parent.queue_free()
				print("Poção Vendida e moeda criada:", parent.name)
			else:
				print("Erro: moedaDourada não está configurada ou carregada.")
func coletarMoeda():
	contadorMoeda +=1
	hud.text = "Moedas: %d" % contadorMoeda
	
