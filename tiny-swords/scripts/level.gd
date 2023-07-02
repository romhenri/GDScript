extends Node2D

var kill_count: int = 0

@export var target_kill_count: int
@export var next_level_scene_path: String
@export var current_level_scene_path: String

func _ready():
	transition.scene_path = current_level_scene_path

func increase_kill_count() -> void:
	kill_count += 1
	
	if kill_count == target_kill_count:
		transition.scene_path = next_level_scene_path
		transition.fade_in(true)
