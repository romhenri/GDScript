extends Node2D

# Declare member variables here. Examples:
var is_back = true
var is_first_time = true
# var b = "text"

var timer

# Called when the node enters the scene tree for the first time.
func _ready():
	# Criar o temporizador
	timer = Timer.new()
	timer.wait_time = 1 # Tempo em segundos
	add_child(timer)

	# Conectar o sinal timeout a uma função
	timer.connect("timeout", self, "_on_Timer_timeout")

	# Iniciar o temporizador


func selectCard():
	if is_back:
		is_back = false;
		get_node('cover').visible = false;
	else:
		is_back = true;
		get_node('cover').visible = true;
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#func _unhandled_input(event):
#	if event is InputEventScreenTouch:
#		print(event.position)
#		pass

func _on_Timer_timeout():
	# Esta função será chamada quando o temporizador atingir o tempo definido
	print("Temporizador expirado!")
	is_first_time = true

func _on_Area2D_input_event(viewport, event, shape_idx):
	if !Input.is_action_pressed("click"):
		return
	
	print(viewport)
	print(event)

	print("Evento detectado!")


func _on_Area_input_event(viewport, event, shape_idx):

	if Input.is_action_pressed("click"):
		if is_first_time:
			is_first_time = false
			timer.start()
			selectCard()
			print("Clicked")
			
	pass # Replace with function body.
