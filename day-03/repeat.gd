extends Node2D

var lista: Array = ['a','b','c']
var lista1: Array = [1,2,3]

func _ready():
	for n in lista:
		print(n)
	
	for n in 4:
		print("Hello " + str(n))
		
	for n in lista:
		print("World " + str(n))
