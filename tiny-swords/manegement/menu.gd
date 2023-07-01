extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	for button in get_tree().get_nodes_in_group("btn"):
		button.pressed.connect(on_button_pressed.bind(button.name))

func on_button_pressed(button_name: String) -> void:
	print(button_name)
	
	match button_name:
		
		"Start":
			get_tree().change_scene_to_file("res://tiny-swords/manegement/level.tscn")
			
		"Quit":
			get_tree().quit()
