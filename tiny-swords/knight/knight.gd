extends CharacterBody2D

@onready var attack_area_collision: CollisionShape2D = get_node("AttackArea/Collision")
@onready var animation: AnimationPlayer = get_node("Animation")
@onready var texture: Sprite2D = get_node("Texture")

@export var move_speed: float = 256.0

@onready var can_attack: bool = true

func _physics_process(_delta: float) -> void:
	print(can_attack)
	
	move()
	animate()
	attack_handler()


# Move System #
func move() -> void:
	if can_attack == false:
		return
	
	var direction: Vector2 = get_direction()
	# print(direction)
	velocity = direction * move_speed
	move_and_slide()
	
func get_direction() -> Vector2:
	return Vector2(
	#	Input.get_axis("ui_left", "ui_right"),
	#	Input.get_axis("ui_up", "ui_down")
	Input.get_axis("move_left", "move_right"),
	Input.get_axis("move_up", "move_down")
	).normalized()

#

# Animation System #
func animate() -> void:
	if can_attack == false:
		return
	
	if velocity.x < 0:
		texture.flip_h = true
		attack_area_collision.position.x = -55.486
		
	if velocity.x > 0:
		texture.flip_h = false
		attack_area_collision.position.x = 55.486
		
	if velocity != Vector2.ZERO: # or Vector(0,0)
		animation.play("run")
		return
	animation.play("idle")

func attack_handler() -> void:
	
	if Input.is_action_just_pressed("attack"):
		can_attack = false
		animation.play("attack")

# var attack: String = "attack"

func _on_animation_animation_finished(attack: String):
	can_attack = true
