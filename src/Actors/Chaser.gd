extends Actor

@onready var game_controller := get_node("/root/GameController")

@export var stop_time: float = 2.0
var stopped := false


func _ready() -> void:
	var speed := max_speed.x
	if game_controller.difficult:
		speed *= 1.2
	_velocity.x = speed


func _physics_process(_delta: float) -> void:
	if stopped:
		return
	set_velocity(_velocity)
	set_up_direction(Vector2.UP)
	move_and_slide()


func stop() -> void:
	stopped = true
	var adjusted_time := stop_time
	if game_controller.difficult:
		adjusted_time *= 0.8
	await get_tree().create_timer(adjusted_time).timeout
	stopped = false
