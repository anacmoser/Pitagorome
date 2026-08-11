extends "res://scripts/npc.gd"

# NPC Professor de Matemática
# Encontrado na sala de aula durante o tour inicial.

func _ready() -> void:
	super._ready()
	npc_name = "Professor de Matemática"

func interact() -> void:
	super.interact()
	GameManager.tour_talked_professor = true
	GameManager.check_tour_progress()
	DialogueManager.start_dialogue(IntroDialogues.get_professor_matematica_sequence())
