extends Area2D

#@export var popup_scene: PackedScene = preload("res://popup.tscn")  # Ensure this is the correct path
var won = false

func _ready():
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	print("Something entered:", body.name)
	if body.is_in_group("player"):  # Check if the player entered
		print("Player entered trigger!")
		won = true
		var player = get_node("/root/main_world/player")
		player.set_movement(true)
		
		close_popup()
		

func close_popup():
	var popup = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent()  # Traverse up to Popup
	if popup:  # Ensure it's a Popup
		popup.hide()  # Hide the popup
		popup.queue_free()  # Optionally remove it
