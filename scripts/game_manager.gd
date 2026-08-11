extends Node

# Autoload: GameManager (Jogo no diagrama UML)
# Controla o estado global, fluxo narrativo, tarefas, transições e posições de spawn.

signal task_updated(task_id: int, task_name: String)
signal phase_changed(new_phase: int)
signal player_info_updated(player_name: String, player_gender: String)

# Dados do jogador (UML: Jogador)
var player_name: String = "Diretor"
var player_gender: String = "M"
var player_speed: float = 110.0

# Estado narrativo
var intro_dialogue_finished: bool = false

# Progresso do Jogo (UML: Jogo)
var current_phase: int = 1
var current_task_id: int = 1
var current_task_name: String = "Tour na Escola"
var completed_tasks: Array[int] = []

# Estado do Tour na Escola (Task 1)
var tour_talked_zelador: bool = false
var tour_talked_professor: bool = false
var tour_completed: bool = false

# Sistema de Spawn entre salas
var target_spawn_id: String = ""

const TASK_NAMES: Dictionary = {
	1: "Tour na Escola",
	2: "Conflito no Horário",
	3: "O Cofre da Escola",
	4: "Quem Está Matando Aula?",
	5: "O Ônibus da Excursão"
}

func _ready() -> void:
	print("[GameManager] Inicializado. Tarefa atual: ", current_task_id)

func set_player_info(new_name: String, new_gender: String = "M") -> void:
	if new_name.strip_edges() != "":
		player_name = new_name.strip_edges()
	player_gender = new_gender
	player_info_updated.emit(player_name, player_gender)

func get_director_title() -> String:
	return "Diretora" if player_gender == "F" else "Diretor"

func get_director_formal_title() -> String:
	return "Srta." if player_gender == "F" else "Sr."

func start_task(task_id: int) -> void:
	current_task_id = task_id
	current_task_name = TASK_NAMES.get(task_id, "Tarefa " + str(task_id))
	task_updated.emit(current_task_id, current_task_name)
	print("[GameManager] Tarefa atualizada: ", current_task_id, " - ", current_task_name)

func complete_task(task_id: int) -> void:
	if not completed_tasks.has(task_id):
		completed_tasks.append(task_id)
		print("[GameManager] Tarefa concluída: ", task_id)
	
	var next_task: int = task_id + 1
	if TASK_NAMES.has(next_task):
		start_task(next_task)
	else:
		advance_phase()

func advance_phase() -> void:
	current_phase += 1
	phase_changed.emit(current_phase)

func check_tour_progress() -> void:
	if tour_talked_zelador and tour_talked_professor and not tour_completed:
		tour_completed = true
		start_task(2) # Ativa Task 2: Conflito no Horário
		print("[GameManager] Tour concluído! Task 2 desbloqueada.")

func change_scene(scene_path: String, spawn_id: String = "") -> void:
	target_spawn_id = spawn_id
	get_tree().change_scene_to_file(scene_path)
