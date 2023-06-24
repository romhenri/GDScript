extends CharacterBody2D

@onready var animation: AnimationPlayer = get_node("Animation")
@onready var texture: Sprite2D = get_node("Texture")
@onready var can_attack: bool = true
@export var move_speed: float = 256.0

func _physics_process(_delta: float) -> void:
	move()
	animate()
	attack_handler()


# Move System #
func move() -> void:
	if can_attack == false:
		return
	else:
		continue
	var direction: Vector2 = get_direction()
	print(direction)
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
	else:
		continue
	if velocity.x < 0:
		texture.flip_h = true
	if velocity.x > 0:
		texture.flip_h = false
		
	if velocity != Vector2.ZERO: # or Vector(0,0)
		animation.play("run")
		return
	animation.play("idle")

func attack_handler() -> void:
	can_attack = false
	
	if Input.is_action_just_pressed("attack"):
		animation.play("attack")

var attack: String = "attack"

func _on_animation_animation_finished(attack: String):
	can_attack = true
