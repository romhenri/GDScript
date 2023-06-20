extends Node2D


func _ready():
	print("Lista de Players:")
	print(get_tree().get_nodes_in_group("player"))
	print("")
	
	print("Sobre o Player Princípal:")
	var main_player = get_tree().get_nodes_in_group("player")[0]
	print(main_player)
	print("Nome: " + main_player.name)
	print("Position: " + str(main_player.position))
	print("Escala: " + str( main_player.scale))
	print("Visível: " + str(main_player.visible))
	print("")
