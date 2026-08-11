extends CanvasLayer

@onready var task_label: Label = $Control/MarginContainer/HBoxContainer/PanelTask/Margin/LabelTask
@onready var director_label: Label = $Control/MarginContainer/HBoxContainer/PanelDirector/Margin/LabelDirector

func _ready() -> void:
	GameManager.task_updated.connect(_on_task_updated)
	GameManager.player_info_updated.connect(_on_player_info_updated)
	_update_display()

func _update_display() -> void:
	if task_label:
		task_label.text = "📋 Tarefa " + str(GameManager.current_task_id) + ": " + GameManager.current_task_name
	if director_label:
		director_label.text = "🎓 " + GameManager.get_director_title() + ": " + GameManager.player_name

func _on_task_updated(_id: int, _name: String) -> void:
	_update_display()

func _on_player_info_updated(_name: String, _gender: String) -> void:
	_update_display()
