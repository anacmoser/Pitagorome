extends "res://scripts/npc.gd"

# NPC Zelador
# Encontrado no corredor durante o tour inicial.

func _ready() -> void:
	super._ready()
	npc_name = "Zelador"

func interact() -> void:
	super.interact()
	GameManager.tour_talked_zelador = true
	GameManager.check_tour_progress()
	DialogueManager.start_dialogue(IntroDialogues.get_zelador_sequence())
