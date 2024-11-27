extends Node

var ervas_criadas: int = 0
const LIMITE_ERVAS: int = 5

var flores_criadas: int = 0
const LIMITE_FLORES: int = 5

#erva

func resetar_erva():
	ervas_criadas = 0

func pode_criar_erva() -> bool:
	return ervas_criadas < LIMITE_ERVAS

func incrementar_ervas():
	if pode_criar_erva():
		ervas_criadas += 1

func decrementar_ervas():
	if ervas_criadas > 0:
		ervas_criadas -= 1

#flor
func resetar_flor():
	flores_criadas = 0

func pode_criar_flor() -> bool:
	return flores_criadas < LIMITE_FLORES

func incrementar_flores():
	if pode_criar_flor():
		flores_criadas += 1

func decrementar_flores():
	if flores_criadas > 0:
		flores_criadas -= 1
