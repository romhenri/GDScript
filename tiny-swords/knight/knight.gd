extends CharacterBody2D

@onready var attack_area_collision: CollisionShape2D = get_node("AttackArea/Collision")
@onready var animation: AnimationPlayer = get_node("Animation")
@onready var aux_animation: AnimationPlayer = get_node("AuxAnimation")
@onready var texture: Sprite2D = get_node("Texture")

var value: int = 25

@export var move_speed: float = 256.0
@export var player_health: int = 100
@export var player_damage: int = 20

@onready var can_attack: bool = true
@onready var can_die: bool = false

func _ready():
	if Global.flip_mode == true:
		texture.flip_v = true

func _physics_process(_delta: float) -> void:
	# print(can_attack)
	
	
	if (
		can_attack == false or can_die
		):
		return
	
	
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
		
	if velocity.x > 0:
		texture.flip_h = false
		attack_area_collision.position.x = 55.486	
	if velocity.x < 0:
		texture.flip_h = true
		attack_area_collision.position.x = -55.486
		
	if velocity != Vector2.ZERO: # or Vector(0,0)
		animation.play("run")
		return
	animation.play("idle")

func attack_handler() -> void:
	
	if Input.is_action_just_pressed("attack"):
		can_attack = false
		animation.play("attack")

# var attack: String = "attack"

func _on_animation_finished(anim_name: String):
	match anim_name:
		"attack":
			can_attack = true
		"death":
			transition.fade_in()

func on_attack_area(body):
	print(body)
	body.update_health(value)
	
func update_health(value: int) -> void:
	player_health -= value
	if player_health <= 0:
		can_die = true
		animation.play("death")
		
		attack_area_collision.set_deferred("disabled", true)
		
	aux_animation.play("hit")
