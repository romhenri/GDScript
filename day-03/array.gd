extends Node

var lista: Array = ['Rômulo', 18, 'Henri']

func _ready():
	print(lista[0])
	print(lista[1])
	print(lista[2])
	
	lista.append(2023)
	print(lista)
	
	lista.pop_back()
	print(lista)
	
	lista.push_front(1)
	print(lista)
