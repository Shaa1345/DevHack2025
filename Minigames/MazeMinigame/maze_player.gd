extends CharacterBody2D

var speed = 100

var player_state 

var can_move = true

func _physics_process(delta: float) -> void:
	if !can_move:
		velocity = Vector2.ZERO
		move_and_slide()
		return
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
		
	elif direction.x != 0 or direction.y != 0:
		player_state = "walking"
	
	velocity = direction * speed
	move_and_slide()
	
func set_movement(movement: bool):
	can_move = movement
