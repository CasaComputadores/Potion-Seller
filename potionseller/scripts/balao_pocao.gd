extends Node2D

# Array contendo os caminhos das texturas das poções
@export var potions := [
	preload("res://sprites/moeda.png"),
	preload("res://sprites/erva.png")
]

# Referência ao Sprite da poção
@onready var potion_sprite := $Pocao

# Função para definir uma poção aleatória no balão
func show_random_potion():
	var random_potion = potions[randi() % potions.size()]
	potion_sprite.texture = random_potion
	potion_sprite.visible = true  # Certifique-se de que o Sprite da poção está visível
	print("poçao a mostra")

# Função para ocultar o balão (se necessário)
func hide_balloon():
	potion_sprite.visible = false  # Esconde o Sprite da poção
	self.visible = false           # Esconde o balão inteiro

# Função para mostrar o balão (se necessário)
func show_balloon():
	print("chama a potion")          # Escolhe uma poção e mostra no balão
	self.visible = true            # Mostra o balão inteiro
	show_random_potion() 
