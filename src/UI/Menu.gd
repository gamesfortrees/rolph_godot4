extends MarginContainer

@onready var game_controller := get_node("/root/GameController")
@export var first_scene: PackedScene


func _on_Easy_button_up() -> void:
	game_controller.set_difficult(false)


func _on_Difficult_button_up() -> void:
	game_controller.set_difficult(true) 


func _on_Legacy_button_up() -> void:
	game_controller.set_music_legacy(true)


func _on_Modern_button_up() -> void:
	game_controller.set_music_legacy(false)


func _on_Start_button_up() -> void:
	get_tree().change_scene_to_packed(first_scene)