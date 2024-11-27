extends Area2D
var selected = false

func _physics_process(delta: float) -> void:
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		deselect_all() # Deselect all other items
		selected = true # Select this item


# Desseleciona todos os itens no grupo
func deselect_all() -> void:
	var items = get_tree().get_nodes_in_group("moedas")
	for item in items:
		if item.has_method("set_selected"): # Verifica se o nó pode alterar o estado de seleção
			item.set_selected(false)

# Função chamada por outros itens para definir se estão selecionados
func set_selected(value: bool) -> void:
	selected = value

# Ao dropar, deseleciona
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false





func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	pass # Replace with function body.
