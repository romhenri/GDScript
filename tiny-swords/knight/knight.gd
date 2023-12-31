extends CharacterBody2D

const AUDIO_TEMPLATE: PackedScene = preload("res://manegement/audio_template.tscn")

@onready var attack_area_collision: CollisionShape2D = get_node("AttackArea/Collision")
@onready var animation: AnimationPlayer = get_node("Animation")
@onready var aux_animation: AnimationPlayer = get_node("AuxAnimation")
@onready var texture: Sprite2D = get_node("Texture")
@onready var dust: GPUParticles2D = get_node("Dust")

@onready var direction: Vector2 = Vector2.ZERO
@export var move_speed: float = 256.0
@export var player_damage: int = 20
@export var player_health: int = 100
@onready var can_attack: bool = true
@onready var is_dead: bool = false

@export var is_mobile: bool = false

func _ready():
	if Global.flip_mode == true:
		texture.flip_v = true
	
	if transition.player_health != 0:
		player_health = transition.player_health
		return
		
	transition.player_health = player_health

func _physics_process(_delta: float) -> void:
	# print(can_attack)
	
	if (
		can_attack == false or is_dead
		):
		return
		
	if !is_mobile:
		direction = get_direction();
	
	move()
	animate()
	attack_handler()

# Move System #
func move() -> void:
	if can_attack == false:
		return
	
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

# Animation System #
func animate() -> void:
	if can_attack == false:
		return
		
	if velocity.x > 0:
		texture.flip_h = false
		attack_area_collision.position.x = 55.486	
	if velocity.x < 0:
		texture.flip_h = true
		attack_area_collision.position.x = -55.486
		
	if velocity != Vector2.ZERO: # or Vector(0,0)
		dust.emitting = true
		animation.play("run")
		return
	dust.emitting = false
	animation.play("idle")

func attack_handler() -> void:
	
	if Input.is_action_just_pressed("attack"):
		dust.emitting = false
		can_attack = false
		animation.play("attack")

func _on_animation_finished(anim_name: String):
	match anim_name:
		"attack":
			can_attack = true
		"death":
			transition.fade_in()
			transition.player_health = 0

func on_attack_area(body):
	print(body)
	body.update_health(player_damage)
	
func update_health(value: int) -> void:
	player_health -= value
	
	transition.player_health = player_health
	get_tree().call_group("level", "update_health", player_health)
	
	if player_health <= 0:
		is_dead = true
		animation.play("death")
		
		attack_area_collision.set_deferred("disabled", true)
		return
	aux_animation.play("hit")

func spawn_sfx(sfx_path: String) -> void:
	var sfx = AUDIO_TEMPLATE.instantiate()
	sfx.sfx_to_play = sfx_path
	add_child(sfx)

func _on_virtual_joystick_analogic_chage(joystick_direction):
	is_mobile = true
	direction = joystick_direction

func _on_button_button_down():
	dust.emitting = false
	can_attack = false
	animation.play("attack")
