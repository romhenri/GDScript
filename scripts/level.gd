extends Node2D

# Variable
var engine = "Godot" #String
var msg01: String = "Olá, viajante, em que posso lhe ajudar?" #String

# The function "_ready():" is executed whe the object is ready 
func _ready():
	print("Hello, world!")
	# Same mode of JavaScript to concatenate
	print("I'm studying " + engine) 
	print(engine.is_empty())
	print(engine.length())
	print(engine.to_upper()) 
# This is a comment

