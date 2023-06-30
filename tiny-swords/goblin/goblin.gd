extends CharacterBody2D

var player_ref: CharacterBody2D = null

const ATTACK_AREA: PackedScene = preload("res://tiny-swords/goblin/EnemyAttackArea.tscn")
const OFFSET: Vector2 = Vector2(0, 31)

@onready var detect_area: CollisionShape2D = get_node("DetectionArea/Detection")
@onready var animation: AnimationPlayer = get_node("Animation")
@onready var aux_animation: AnimationPlayer = get_node("AuxAnimation")
@onready var texture: Sprite2D = get_node("Texture")

var can_die : bool = false
var health : int = 100

@export var distance_threshold: int = 60
@export var enemy_move_speed: float = 192

var is_attacking: bool = false

# Global variables using the Autoload / Singleton system.
func _ready():
	if Global.flip_mode == true:
		texture.flip_v = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if can_die:
		return
	
	if player_ref == null or player_ref.can_die:
		velocity = Vector2.ZERO
		animate()
		return
	
	# print("Has Player Ref")
	# print(player_ref.global_position)
	
	var direction: Vector2 = global_position.direction_to(player_ref.global_position)
	var distance: float = global_position.distance_to(player_ref.global_position)
	
	# print(direction)
	
	if direction.x > 0:
		texture.flip_h = false
	if direction.x < 0:
		texture.flip_h = true
	
	if distance < distance_threshold:
		
		animation.play('attack')
		return
	
	if is_attacking == true:
		return
	
	velocity = direction * enemy_move_speed
	move_and_slide()
	animate()

func spawn_attack_area():
	var attack_area = ATTACK_AREA.instantiate()
	# attack_area.position = position + OFFSET
	add_child(attack_area)

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

var anim_name = "attack"

# Lembre-se que os Signals retornam valores, nós não passamos valores a eles.

func _on_animation_started(anim_name):
	if anim_name == "attack":
		print('Attack started')
		is_attacking = true

func _on_animatio_finished(anim_name):
	if anim_name == "attack":
		print('Attack started')
		is_attacking = false

func update_health(value: int) -> void:
	health -= value
	
	aux_animation.play("hit")
	
	if health <= 0:
		can_die = true
		animation.play("death")
		#queue_free()
		
		#attack_area_collision.set_deferred("disabled", true)
