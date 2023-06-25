extends CharacterBody2D

var player_ref: CharacterBody2D = null

@onready var detect_area: CollisionShape2D = get_node("DetectionArea/Detection")
@onready var animation: AnimationPlayer = get_node("Animation")

@export var distance_threshold: int = 60
@export var enemy_move_speed: float = 192

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	
	if player_ref == null:
		return
	
	# print("Has Player Ref")
	print(player_ref.global_position)
	var direction: Vector2 = global_position.direction_to(player_ref.global_position)
	var distance: float = global_position.distance_to(player_ref.global_position)
	
	if distance < distance_threshold:
		print('S')
		return
	
	velocity = direction * enemy_move_speed
	move_and_slide()
	animate()

func animate():
	if velocity != Vector2.ZERO:
		animation.play("run")
		return
	
	animation.play("idle")

func _on_detection_area_body_entered(body):
	player_ref = body
	
	detect_area.debug_color = Color("d1564820")
	print(body)

func _on_detection_area_body_exited(body):
	player_ref = null
	detect_area.debug_color = Color("ffdd1203")
	print(body) # Replace with function body.
