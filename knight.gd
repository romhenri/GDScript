extends CharacterBody2D

@export var move_speed: float = 256.0

func _physics_process(_delta: float) -> void:
	var direction: Vector2 = get_direction()
	print(direction)
	velocity = direction * move_speed
	move_and_slide()
	
func get_direction() -> Vector2:
	return Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	).normalized()
