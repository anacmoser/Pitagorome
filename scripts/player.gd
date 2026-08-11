extends CharacterBody2D

# Script do Jogador / Diretor
@export var speed: float = 100.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var interact_ray: RayCast2D = $InteractRay

var current_direction: Vector2 = Vector2.DOWN

func _ready() -> void:
	# Se houver um ponto de spawn definido no GameManager, posiciona o jogador nele
	if GameManager.target_spawn_id != "":
		var spawn_point = get_parent().find_child(GameManager.target_spawn_id, true, false)
		if spawn_point:
			global_position = spawn_point.global_position
			print("[Player] Posicionado no spawn point: ", GameManager.target_spawn_id)
		GameManager.target_spawn_id = ""
	
	if animated_sprite:
		animated_sprite.play("idle_down")

func _physics_process(_delta: float) -> void:
	if DialogueManager.is_active:
		velocity = Vector2.ZERO
		_update_animation(Vector2.ZERO)
		move_and_slide()
		return
	
	var input_vector := Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)
	
	if input_vector != Vector2.ZERO:
		input_vector = input_vector.normalized()
		current_direction = input_vector
		velocity = input_vector * speed
		_update_raycast_direction(input_vector)
	else:
		velocity = Vector2.ZERO
	
	_update_animation(input_vector)
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if DialogueManager.is_active:
		return
	
	if event.is_action_pressed("abrir_licoes") or event.is_action_pressed("ui_accept"):
		_try_interact()

func _update_raycast_direction(dir: Vector2) -> void:
	if abs(dir.x) > abs(dir.y):
		interact_ray.target_position = Vector2(sign(dir.x) * 22.0, 0.0)
	else:
		interact_ray.target_position = Vector2(0.0, sign(dir.y) * 22.0)

func _update_animation(input_dir: Vector2) -> void:
	if not animated_sprite:
		return
	
	if input_dir == Vector2.ZERO:
		if abs(current_direction.x) > abs(current_direction.y):
			if current_direction.x > 0:
				animated_sprite.play("idle_right")
			else:
				animated_sprite.play("idle_left")
		else:
			if current_direction.y < 0:
				animated_sprite.play("idle_up")
			else:
				animated_sprite.play("idle_down")
	else:
		if abs(input_dir.x) > abs(input_dir.y):
			if input_dir.x > 0:
				animated_sprite.play("walk_right")
			else:
				animated_sprite.play("walk_left")
		else:
			if input_dir.y < 0:
				animated_sprite.play("walk_up")
			else:
				animated_sprite.play("walk_down")

func _try_interact() -> void:
	if interact_ray and interact_ray.is_colliding():
		var collider = interact_ray.get_collider()
		if collider and collider.has_method("interact"):
			collider.interact()
