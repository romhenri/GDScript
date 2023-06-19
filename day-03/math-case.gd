extends Node

@export var tipo: String= "pedra"

func _ready(): 
	match tipo:
		"pedra":
			print("Você vence Tesoura, mas é derrotado por Papel.")
		"papel":
			print("Você vence Pedra, mas é derrotado por Tesoura.")
		"tesoura":
			print("Você vence Papel, mas é derrotado por Pedra.")
		_:
			print("Tipo não identificado.")
