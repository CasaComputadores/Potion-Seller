extends RichTextLabel

@export var text_color: Color
@export var text_color2: Color

func _process(delta: float) -> void:
	var current_text = text  # Agora a variável current_text é declarada corretamente
	if Global.contador_moeda < 0:
		# Ativa o BBCode e muda a cor de todo o texto existente
		var color_hex = text_color.to_html()  # Converte a cor para formato HTML
		bbcode_enabled = true  # Habilita BBCode
		text = "[color=" + color_hex + "]" + current_text + "[/color]"  # Aplica a cor ao texto
	elif Global.contador_moeda >= 0:
		# Ativa o BBCode e muda a cor de todo o texto existente
		var color_hex = text_color2.to_html()  # Converte a cor para formato HTML
		bbcode_enabled = true  # Habilita BBCode
		text = "[color=" + color_hex + "]" + current_text + "[/color]"  # Aplica a cor ao texto
