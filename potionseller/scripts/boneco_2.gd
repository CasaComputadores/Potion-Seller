extends Node2D
#var coin = 0;
@onready var hud = $HUD/Moeda
var contadorMoeda: int = 0
func _on_area_2d_area_entered(area: Area2D) -> void:
	print("Objeto entrou:", area.name)
	if area.is_in_group("pocoes"):
		var parent = area.get_parent()
		if parent:
			coletarMoeda()
			parent.queue_free()
			print("Poção Vendida:", parent.name)
func coletarMoeda():
	contadorMoeda +=1
	hud.text = "Moedas: %d" % contadorMoeda
	
