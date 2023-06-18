extends Node2D

# Variable
var engine = "Godot" #String
var msg01: String = "Olá, viajante, em que posso lhe ajudar?" #String
var msg02: String = "Sua pontuação é de " #String
var msg02_1: String = "pontos." #String
var score: int = 22 #Number: Int and Float
var strong: bool = true #Number: Int and Float

# The function "_ready():" is executed whe the object is ready 
func _ready():
	print("Hello, world!")
	# Same mode of JavaScript to concatenate
	print(engine.is_empty())
	print(engine.length())
	print(engine.to_upper()) 
	# This is a comment
	print(msg02 + "score")

