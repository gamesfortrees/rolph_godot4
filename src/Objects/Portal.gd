@tool
extends Area2D

@onready var anim_player: AnimationPlayer = $AnimationPlayer
@export var next_scene: PackedScene


func _on_body_entered(_body: PhysicsBody2D) -> void:
	teleport()


func _get_configuration_warnings() -> PackedStringArray:
	if next_scene:
		return PackedStringArray(["The next scene property can't be empty"])
	else:
		return PackedStringArray([""])


func teleport() -> void:
	anim_player.play("fade_in")
	await anim_player.animation_finished
	get_tree().change_scene_to_packed(next_scene)
