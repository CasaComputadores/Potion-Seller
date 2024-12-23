extends Node

#ingredientes
const LIMITE: int = 2

const POT_LIMITE: int = 1

var ervas_criadas: int = 0
var flores_criadas: int = 0
var ametista_criadas: int = 0
var coracao_criadas: int = 0
var po_criadas: int = 0

#npcs
var npc = 0

#moeda
var contador_moeda = 10

#pocao
var contador_potion = 0

# máximo de 3 ingredientes no caldeirão
var maxIngredientesCaldeirao = 0

var musicaInicial = false
var musicaInicialResetada = false

var cenaJogo = null

var labelIngredientesCaldeirao = true

#erva
func resetar_erva():
	ervas_criadas = 0

func pode_criar_erva() -> bool:
	return ervas_criadas < LIMITE

func incrementar_ervas():
	if pode_criar_erva():
		ervas_criadas += 1

func decrementar_ervas(quantidade):
	if ervas_criadas > 0:
		ervas_criadas -= quantidade

#flor
func resetar_flor():
	flores_criadas = 0

func pode_criar_flor() -> bool:
	return flores_criadas < LIMITE

func incrementar_flores():
	if pode_criar_flor():
		flores_criadas += 1

func decrementar_flores(quantidade):
	if flores_criadas > 0:
		flores_criadas -= quantidade
		
#ametista

func resetar_ametista():
	ametista_criadas = 0

func pode_criar_ametista() -> bool:
	return ametista_criadas < LIMITE

func incrementar_ametista():
	if pode_criar_ametista():
		ametista_criadas += 1

func decrementar_ametista(quantidade):
	if ametista_criadas > 0:
		ametista_criadas -= quantidade
		
#coracao

func resetar_coracao():
	coracao_criadas = 0

func pode_criar_coracao() -> bool:
	return coracao_criadas < LIMITE

func incrementar_coracao():
	if pode_criar_coracao():
		coracao_criadas += 1

func decrementar_coracao(quantidade):
	if coracao_criadas > 0:
		coracao_criadas -= quantidade
		
#po

func resetar_po():
	po_criadas = 0

func pode_criar_po() -> bool:
	return po_criadas < LIMITE

func incrementar_po():
	if pode_criar_po():
		po_criadas += 1

func decrementar_po(quantidade):
	if po_criadas > 0:
		po_criadas -= quantidade

var bonecos = [
	"res://cenas/npc/boneco_1.tscn",
	"res://cenas/npc/boneco_2.tscn",
	"res://cenas/npc/boneco_3.tscn",
	"res://cenas/npc/boneco_4.tscn",
	"res://cenas/npc/boneco_5.tscn",
	"res://cenas/npc/boneco6.tscn"
]

# Função para instanciar uma boneco aleatório
func instantiate_random_scene(parent_node: Node, areaNPC: Area2D):
	await get_tree().create_timer(1.0).timeout
	
	if bonecos.size() > 0:
		# Escolhe um caminho de cena aleatoriamente
		var random_index = randi() % bonecos.size()
		var scene_path = bonecos[random_index]
		
		# Carrega a cena
		var scene = load(scene_path).instantiate()
		
		scene.position = areaNPC.global_position
		
		# Instancia a cena no nó pai especificado
		parent_node.add_child(scene)
		print("boneco random add no parent node: ", parent_node)
		return scene
	else:
		print("O array de cenas está vazio.")
		return null

func verifica_quantidade_pocao():
	if contador_potion < POT_LIMITE:
		return true
	return false
	
func aumenta_quantidade_pocao():
	contador_potion += 1
	
func diminuir_quantidade_pocao():
	contador_potion -= 1
	
func resetar_pot():
	contador_potion = 0
