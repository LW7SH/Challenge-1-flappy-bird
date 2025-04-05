extends ParallaxBackground

var obstacle = preload("res://Scenes/obstacle.tscn")
@export var spawn_timer : Timer
@export var score_label : Label

func _ready() -> void:
	spawn_obstacle()

func _process(delta: float) -> void:
	score_label.text =str($Player.score)

func spawn_obstacle():
	var next_obstacle = obstacle.instantiate()
	next_obstacle.position.x = 1500
	add_child(next_obstacle)
	spawn_timer.start()



func _on_spawn_obstacle_timeout() -> void:
	spawn_obstacle()
