extends Node2D

@onready var interface: CanvasLayer = get_node("Interface")
@onready var health_label:Label = interface.get_node("Label")

var kill_count: int = 0

@export var target_kill_count: int
@export var next_level_scene_path: String
@export var current_level_scene_path: String

func _ready():
	transition.scene_path = current_level_scene_path
	update_health(transition.player_health)

func update_health(_new_health:int) -> void:
	health_label.text = "HP: " + str(transition.player_health)

func increase_kill_count() -> void:
	kill_count += 1
	
	if kill_count >= target_kill_count:
		print("Yes")
		transition.scene_path = next_level_scene_path
		transition.fade_in(true)
