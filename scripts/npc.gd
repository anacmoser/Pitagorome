class_name NPC
extends CharacterBody2D

# Base NPC (UML: Objeto / NPC)
# Permite interação, indicador visual, animação idle e direcionamento para o player.

@export var npc_name: String = "NPC"
@export var default_animation: String = "idle_down"
@export var auto_start_dialogue: bool = false

@onready var interaction_area: Area2D = $InteractionArea
@onready var hint_label: Label = $HintLabel
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var player_in_range: bool = false
var player_ref: Node2D = null

func _ready() -> void:
	if animated_sprite:
		animated_sprite.play(default_animation)
	
	if hint_label:
		hint_label.visible = false
	
	if interaction_area:
		interaction_area.body_entered.connect(_on_body_entered)
		interaction_area.body_exited.connect(_on_body_exited)

func _unhandled_input(event: InputEvent) -> void:
	if not player_in_range or DialogueManager.is_active:
		return
	
	if event.is_action_pressed("abrir_licoes") or event.is_action_pressed("ui_accept") or (event is InputEventKey and event.pressed and (event.keycode == KEY_E or event.physical_keycode == KEY_E or event.keycode == KEY_SPACE or event.keycode == KEY_ENTER)):
		get_viewport().set_input_as_handled()
		interact()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") or body.name == "Player" or body.name == "director":
		player_in_range = true
		player_ref = body
		if hint_label:
			hint_label.visible = true
		if auto_start_dialogue and not DialogueManager.is_active:
			auto_start_dialogue = false
			interact()

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player") or body.name == "Player" or body.name == "director":
		player_in_range = false
		player_ref = null
		if hint_label:
			hint_label.visible = false

func face_player() -> void:
	if not animated_sprite or not player_ref:
		return
	var dir: Vector2 = (player_ref.global_position - global_position).normalized()
	if abs(dir.x) > abs(dir.y):
		animated_sprite.play("idle_right" if dir.x > 0 else "idle_left")
	else:
		animated_sprite.play("idle_down" if dir.y > 0 else "idle_up")

func interact() -> void:
	if hint_label:
		hint_label.visible = false
	face_player()
	print("[NPC] Interagindo com: ", npc_name)
