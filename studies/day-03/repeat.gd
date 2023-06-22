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
	
	if lista.size() == 3:
		print("Lista tem 3 elementos.")
	
	for i in range(1, 4): # 1, 2, 3
		print(i)
	
	print("De 10 em 10")
	
	for i in range(0, 101, 10): # 10, 20, 30, 40, 50, 60, 70, 80, 90, 100...
		print(i)
	
	print("Agora decrementando...")
	
	for i in range(50, 0, -10): # 50, 40, 30, 20, 10...
		print(i)
