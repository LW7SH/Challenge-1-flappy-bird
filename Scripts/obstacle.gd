extends Node2D

@export var speed : float

func _ready():
	position.y = randi_range(200,500)
	

func _process(delta):
	position.x -= speed * delta
	
	if position.x < -30 :
			queue_free()



func _on_gap_body_entered(body: Node2D) -> void:
	body.score += 1
	print(body.score)
