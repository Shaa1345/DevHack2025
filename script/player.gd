
#note: assign keys in input keys section
extends CharacterBody2D

var speed = 100

var can_move = true 

var player_state 

func _physics_process(delta: float) -> void:
	#disable movement if boolean is false
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
	
	play_anim(direction)
	
func play_anim(dir):
	#print(dir)
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
	if player_state == "walking":
		if dir.y == -1:
			$AnimatedSprite2D.play("n-walk")
		if dir.x == 1:
			$AnimatedSprite2D.play("e-walk")
		if dir.y == 1:
			$AnimatedSprite2D.play("s-walk")
		if dir.x == -1:
			$AnimatedSprite2D.play("w-walk")
		
		if dir.x > 0.5 and dir.y < 0.5:
			$AnimatedSprite2D.play("e-walk")
			
#function for player movement
func set_movement(movement: bool):
	can_move = movement
	
	
