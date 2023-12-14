extends Node2D

var active : String = ""
var destiny : String = ""

var small : int = 5
var medium : int = 0
var big : int = 0

func _ready():
	pass

func _physics_process(delta):
	if active != "" && destiny != "":
		print("Foiiiiiiiiiiii")
