extends CharacterBody2D

@export var gravity : float
@export var respawner_timer: Timer

var dead = false
var score = 0

func _physics_process(delta: float) -> void:
	velocity.y += 1
	
	if not dead and Input.is_action_just_pressed("jump"):
		print("jump")
		velocity.y = -12
		
	var collision = move_and_collide(velocity)
	
	if collision:
		print('you lost')
		respawn()


func respawn():
	print('respawn timer started')
	dead = true
	$PlayerHitBox.disabled = true
	$PlayerSprite.modulate = Color(1.5, 0, 0)
	respawner_timer.start()

func _on_respawn_time_timeout() -> void:
	print('resetting')
	get_tree().change_scene_to_file("res://Scenes/background.tscn")
