extends Node2D

@onready var areaMoeda = $"../../Area2D"
@export var moedaDourada: PackedScene


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("Objeto entrou:", area.name)
	if area.is_in_group("pocoes"):
		var parent = area.get_parent()
		if parent:
			if moedaDourada:
				var moeda = moedaDourada.instantiate()
				print("Moeda instanciada:", moeda)
				add_child(moeda) # Adiciona a moeda à cena atual
				moeda.position = to_local(areaMoeda.global_position) 
				print("Moeda posicionada em:", moeda.position)
				parent.queue_free()
				print("Poção Vendida e moeda criada:", parent.name)
			else:
				print("Erro: moedaDourada não está configurada ou carregada.")
