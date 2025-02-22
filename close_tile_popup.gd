extends Sprite2D


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			var player = get_node("/root/main_world/player")
			player.set_movement(true)
			close_popup()

func close_popup():
	var popup = get_parent()  # Traverse up to Popup
	if popup:  # Ensure it's a Popup
		popup.hide()  # Hide the popup
		popup.queue_free()  # Optionally remove it
