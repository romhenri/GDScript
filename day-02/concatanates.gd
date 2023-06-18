extends Node

var msg: String = "Você tem "
@export var score: int = 22
var msg_1: String = " pontos."

func _ready():
	print(msg + str(score) + msg_1)

