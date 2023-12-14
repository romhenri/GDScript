extends Node2D

var water : int = 8
var max_water : int = 8

func _ready():
	pass # Replace with function body.

func _on_hitbox_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		if Game.active == "":
			Game.active = "big"
			print("big!")
		else:
			Game.destiny = "big"

