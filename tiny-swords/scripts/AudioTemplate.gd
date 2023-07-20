extends AudioStreamPlayer

var sfx_to_play: String = ""

func _ready():
	stream = load(sfx_to_play)
	play()

func _on_timer_timeout():
	queue_free()
