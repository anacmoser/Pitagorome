extends "res://scripts/npc.gd"

# NPC Coordenadora Srta. Margareth H.
@export var is_intro_scene: bool = true

func _ready() -> void:
	super._ready()
	npc_name = "Coordenadora"
	
	# Só dispara o diálogo de introdução se for a primeira vez que o jogo roda!
	if is_intro_scene and not GameManager.intro_dialogue_finished:
		get_tree().create_timer(0.5).timeout.connect(_start_intro)

func _start_intro() -> void:
	if not DialogueManager.is_active and not GameManager.intro_dialogue_finished:
		DialogueManager.start_dialogue(IntroDialogues.get_intro_sequence(), func():
			GameManager.intro_dialogue_finished = true
		)

func interact() -> void:
	super.interact()
	if GameManager.current_task_id == 1:
		if is_intro_scene:
			DialogueManager.start_dialogue([
				{
					"speaker": "Coordenadora",
					"text": "Saia pela porta ao sul para começarmos o tour pelo corredor da escola!"
				}
			])
		else:
			DialogueManager.start_dialogue([
				{
					"speaker": "Coordenadora",
					"text": "Converse com o Zelador no corredor e depois entre na Sala de Matemática para conhecer o professor!"
				}
			])
	elif GameManager.current_task_id == 2:
		DialogueManager.start_dialogue([
			{
				"speaker": "Coordenadora",
				"text": "Diretor(a), temos um problema! Marcaram duas aulas no mesmo horário na Sala de Matemática. Vá até a Sala de Matemática e examine o Quadro de Horários na parede para resolver!"
			}
		])
	elif GameManager.current_task_id == 3:
		DialogueManager.start_dialogue([
			{
				"speaker": "Coordenadora",
				"text": "Chegaram novos materiais escolares, mas o zelador esqueceu a senha do cadeado do almoxarifado na Coordenação! Vá até a Coordenação e abra o Cofre."
			}
		])
	else:
		DialogueManager.start_dialogue([
			{
				"speaker": "Coordenadora",
				"text": "Excelente trabalho na administração da escola até aqui, Diretor(a) " + GameManager.player_name + "!"
			}
		])
