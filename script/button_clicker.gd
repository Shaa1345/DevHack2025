extends Node

var click_count = 0
var countdown_time = 3
var win_num_clicks = 12
var countdown_label
var timesClicked
var password = 'Dlkdjfash\n'
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timesClicked = $TimesClicked
	countdown_label = $TimeLeft
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	countdown_timer(delta)


func _on_pressed() -> void:
	if(click_count < win_num_clicks && countdown_time > 0):
		click_count += 1
	print(click_count)
	timesClicked.text = "Times Clicked: " + str(click_count)
	
func close_popup():
	var player = get_node("/root/main_world/player")
	player.set_movement(true)
	var popup = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent()  # Traverse up to Popup
	if popup:  # Ensure it's a Popup
		popup.hide()  # Hide the popup
		popup.queue_free()  # Optionally remove it
			
func countdown_timer(delta):
	
	if countdown_time > 0 && click_count < win_num_clicks:
		countdown_time -= delta 	
		if countdown_time >=10:
			countdown_label.text = str("0:" + str(int(countdown_time)))
		else:
			countdown_label.text = str("0:0" + str(int(countdown_time)))
	elif countdown_time <=0 && click_count < win_num_clicks:
		countdown_label.text = str("You lose!")
		await get_tree().create_timer(2).timeout
		close_popup()	
	elif click_count >= win_num_clicks:
		countdown_label.text = str("You Win!")
		save_to_file(password)
		await get_tree().create_timer(2).timeout
		close_popup()
		
func save_to_file(content):
	#this is the purple file
	var path = "user://a175c9.txt"
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(content)
	var absolute_path = ProjectSettings.globalize_path(path)
	OS.shell_open(absolute_path)
		
