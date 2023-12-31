extends Node

var seeds: int = 0
var game_over: bool = false
var triggered_dialogs: Array
var difficult: bool = false
var music_legacy: bool = false


func _physics_process(_delta: float) -> void:
	if game_over and Input.is_action_just_pressed("jump"):
		restart_level()


func add_seed() -> void:
	_update_seeds(1)


func subtract_seed() -> bool:
	if seeds <= 0:
		return false
	_update_seeds(-1)
	return true


func _update_seeds(change: int) -> void:
	seeds += change
	var count_label := get_node("/root/level/UI/HUD/HBoxContainer/MarginContainer/count")
	count_label.text = str(seeds)


func player_died() -> void:
	await get_tree().create_timer(0.4).timeout
	game_over = true
	var game_over_ui := get_node("/root/level/UI/GameOver")
	game_over_ui.visible = true


func restart_level() -> void:
	seeds = 0
	game_over = false
	get_tree().paused = false
	get_tree().reload_current_scene()


func set_difficult(diff: bool) -> void:
	difficult = diff


func set_music_legacy(legacy: bool) -> void:
	music_legacy = legacy
