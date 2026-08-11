extends Node

# Autoload: DialogueManager
# Responsável por gerenciar caixas de diálogo, fluxo de texto e eventos narrativos.

signal dialogue_started()
signal dialogue_line_changed(speaker: String, text: String)
signal dialogue_ended()
signal dialogue_event_triggered(event_name: String)

var is_active: bool = false
var dialogue_queue: Array = []
var current_line_index: int = 0
var current_on_complete: Callable = Callable()

var dialogue_box_instance: Node = null

func _ready() -> void:
	print("[DialogueManager] Inicializado.")

func register_dialogue_box(box: Node) -> void:
	dialogue_box_instance = box

func start_dialogue(lines: Array, on_complete: Callable = Callable()) -> void:
	if lines.is_empty():
		return
	
	dialogue_queue = lines.duplicate(true)
	current_line_index = 0
	current_on_complete = on_complete
	is_active = true
	dialogue_started.emit()
	
	_show_current_line()

func _show_current_line() -> void:
	if current_line_index >= dialogue_queue.size():
		end_dialogue()
		return
	
	var line_data: Dictionary = dialogue_queue[current_line_index]
	var speaker: String = line_data.get("speaker", "")
	var raw_text: String = line_data.get("text", "")
	
	# Formata placeholders como {player_name} e {player_title}
	var text: String = raw_text.replace("{player_name}", GameManager.player_name)
	text = text.replace("{player_title}", GameManager.get_director_formal_title())
	
	dialogue_line_changed.emit(speaker, text)
	
	if line_data.has("event"):
		dialogue_event_triggered.emit(line_data["event"])

func advance() -> void:
	if not is_active:
		return
	
	current_line_index += 1
	_show_current_line()

func end_dialogue() -> void:
	is_active = false
	dialogue_queue.clear()
	current_line_index = 0
	dialogue_ended.emit()
	
	if current_on_complete.is_valid():
		current_on_complete.call()
		current_on_complete = Callable()
