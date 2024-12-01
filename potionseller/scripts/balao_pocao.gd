extends Node2D

# Array contendo os caminhos das texturas das poções
@export var potions := [
	preload("res://sprites/potion/Amarelo medio.png"),
	preload("res://sprites/potion/Amarelo pequeno.png"),
	preload("res://sprites/potion/Amerelo grande.png"),
	preload("res://sprites/potion/Azul grande.png"),
	preload("res://sprites/potion/Azul media.png"),
	preload("res://sprites/potion/Azul pequena.png"),
	preload("res://sprites/potion/Rosa grande.png"),
	preload("res://sprites/potion/Rosa media.png"),
	preload("res://sprites/potion/Rosa pequeno.png"),
	preload("res://sprites/potion/Verde grande.png"),
	preload("res://sprites/potion/Verde media.png"),
	preload("res://sprites/potion/Verde pequena.png"),
	preload("res://sprites/potion/Vermelha grande.png"),
	preload("res://sprites/potion/Vermelha media.png"),
	preload("res://sprites/potion/Vermelha pequena.png")
]

# Referência ao Sprite da poção
@onready var potion_sprite := $Pocao
var pocao_escolhida

# Função para definir uma poção aleatória no balão
func show_random_potion():
	var random_potion = potions[randi() % potions.size()]
	potion_sprite.texture = random_potion
	pocao_escolhida = potion_sprite.texture
	potion_sprite.visible = true  # Certifique-se de que o Sprite da poção está visível
	print("poçao a mostra")
	return pocao_escolhida
	
func getPocao():
	return pocao_escolhida

# Função para ocultar o balão (se necessário)
func hide_balloon():
	potion_sprite.visible = false  # Esconde o Sprite da poção
	self.visible = false           # Esconde o balão inteiro

# Função para mostrar o balão (se necessário)
func show_balloon():
	print("chama a potion")          # Escolhe uma poção e mostra no balão
	self.visible = true            # Mostra o balão inteiro
	show_random_potion() 
