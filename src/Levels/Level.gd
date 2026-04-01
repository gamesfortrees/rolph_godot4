extends Node2D

@onready var music: AudioStreamPlayer = $background_music
@onready var game_controller := get_node("/root/GameController")

const LEGACY_MUSIC = preload("res://assets/sounds/game loop legacy.wav")


func _ready():
	if game_controller.music_legacy:
		music.stream = LEGACY_MUSIC
		music.play()
