extends Node2D

@onready var grass_tilemap: TileMap = get_node("Grass")
@onready var water_tilemap: TileMap = get_node("Water")

var grass_used_cells: Array

func _ready():
	var used_grass_rect: Rect2 = grass_tilemap.get_used_rect()
	grass_used_cells = grass_tilemap.get_used_cells(0)
	generate_water_tiles(used_grass_rect)
	# print(grass_used_cells)

func generate_water_tiles(used_rect: Rect2):
	for x in range (used_rect.position.x - 10, used_rect.size.x + 10):
		for y in range (used_rect.position.y - 10, used_rect.size.y + 10):
			if grass_used_cells.has(Vector2i(x,y)):
				continue
			
			# print(Vector2(x,y))
			water_tilemap.set_cell(
				0,
				Vector2i(x,y),
				0,
				Vector2i(0,0)
			)
