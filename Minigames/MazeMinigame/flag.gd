extends Area2D

var won = false 
signal won_changed(is_won)
var timer
var countdown_label
var countdown_time = 18.0
#@export var popup_scene: PackedScene = preload("res://popup.tscn")  # Ensure this is the correct path

var code = "asDdfEn5VkamHkkAkCjKsssSl\n"
func _ready():
	timer = $Timer
	countdown_label = $TimerDisplay
	print(countdown_label)
	connect("body_entered", _on_body_entered)
	countdown_label.text = str("0:"+ str(countdown_time))
	timer.wait_time = 1.0  # Update every second
	timer.start()  # Start the timer
	timer.one_shot = false
	
func _on_body_entered(body):
	print("Something entered:", body.name)
	if body.is_in_group("player"):  # Check if the player entered
		print("Player entered trigger!")
		won = true
		whenWon()
		emit_signal("won_changed", won)
		
		

func close_popup():
	var player = get_node("/root/main_world/player")
	player.set_movement(true)
	var popup = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent()  # Traverse up to Popup
	if popup:  # Ensure it's a Popup
		popup.hide()  # Hide the popup
		popup.queue_free()  # Optionally remove it

func _process(delta):
	countdown_timer(delta)

func save_to_file(content):
	#this is the blue pass
	var path = "user://5296b6.txt"
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(content)
	var absolute_path = ProjectSettings.globalize_path(path)
	OS.shell_open(absolute_path)
	
func countdown_timer(delta):
	var player = get_node("../../MazePlayer")
	
	if countdown_time > 0 && !won:
		countdown_time -= delta 
		if countdown_time >=10:
			countdown_label.text = str("0:" + str(int(countdown_time)))
		else:
			countdown_label.text = str("0:0" + str(int(countdown_time)))
	elif countdown_time <=0 && !won:
		player.set_movement(false)
		countdown_label.text = str("You lose!")
		await get_tree().create_timer(2).timeout
		close_popup()
		
		

func whenWon():
	print("You won!")
	countdown_label.text = str("You win!")	
	countdown_label.position = Vector2(countdown_label.position.x - 5, countdown_label.position.y)
	save_to_file(code)	
	await get_tree().create_timer(2).timeout	
	close_popup()
