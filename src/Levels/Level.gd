extends Node2D

@onready var music: AudioStreamPlayer = $background_music
@onready var game_controller := get_node("/root/GameController")

const legacy_music = preload("res://src/Music/legacy.tres")


func _ready():
	if game_controller.music_legacy:
		music.stream = legacy_music
		music.play()
