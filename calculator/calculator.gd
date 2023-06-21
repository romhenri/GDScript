extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for button in get_tree().get_nodes_in_group("buttons"):
		button.pressed.connect(pressionado.bind(button.text))
		button.connect("pressed", Callable(self, "pressionado"))

func pressionado(nome_do_botao: String):
	print(nome_do_botao)

func on_button_Clear_pressed():
	print("Botão de limpeza pressionado.") # Replace with function body.
