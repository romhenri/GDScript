extends CharacterBody2D

var player_ref: CharacterBody2D = null

@onready var detect_area: CollisionShape2D = get_node("DetectionArea/Detection")

@export var move_speed: float = 192


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_detection_area_body_entered(body):
	detect_area.debug_color = Color("d1564820")
	print(body)

func _on_detection_area_body_exited(body):
	detect_area.debug_color = Color("ffdd1203")
	print(body) # Replace with function body.
