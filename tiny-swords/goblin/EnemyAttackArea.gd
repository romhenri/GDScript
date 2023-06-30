extends Area2D

@export var damage: int = 20

func _on_body_entered(body):
	body.update_health(damage)

func _on_life_timer_timeout():
	queue_free()
