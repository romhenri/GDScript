extends Node2D

@onready var grass_tilemap: TileMap = get_node("Grass")
@onready var water_tilemap: TileMap = get_node("Water")


func _ready():
	var used_grass_rect: Rect2 = grass_tilemap.get_used_rect()
	generate_water_tiles(used_grass_rect)

func generate_water_tiles(used_rect: Rect2):
	for x in range (used_rect.position.x, used_rect.size.x):
		for y in range (used_rect.position.y, used_rect.size.y):
			pass
