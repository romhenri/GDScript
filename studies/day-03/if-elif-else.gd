extends Node2D

@export var idade: int = 2

func _ready():
	if idade < 18:
		print("Você é menor de idade.")
	elif idade >= 18:
		print("Você é maior de idade.")
	
	if idade <= 13:
		print("Você é uma criança.")
	elif idade > 13 and idade < 18:
		print("Você é um adolescente.")
	elif idade >= 18:
		print("Você é um adulto.")
