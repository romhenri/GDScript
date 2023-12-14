extends Node2D

var water : int = 0
var max_water : int = 5

func _ready():
	pass # Replace with function body.

func _on_hitbox_click_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		if Game.active == "":
			Game.active = "medium"
			print("Clicked Medium!!!!")
		else:
			Game.destiny = "medium"
