extends Area2D

@export (String, FILE, "*.json") var dialoge_file_path: String

@onready var dialog_controller = get_node("/root/level/UI/DialogController")
@onready var game_controller = get_node("/root/GameController")

func _on_body_entered(body: PhysicsBody2D) -> void:
	if body.layers != 1:
		return
	if !dialoge_file_path in game_controller.triggered_dialogs:
		start()
		game_controller.triggered_dialogs.append(dialoge_file_path)

func start() -> void:
	var dialog: Array = load_dialog(dialoge_file_path)
	dialog_controller.show_dialog(dialog)
	
func load_dialog(file_path) -> Array:
	var file = File.new()
	assert(file.file_exists(file_path))
	
	file.open(file_path, file.READ)
	var test_json_conv = JSON.new()
	test_json_conv.parse(file.get_as_text())
	var dialog = test_json_conv.get_data()
	assert(dialog.size() > 0)
	return dialog
