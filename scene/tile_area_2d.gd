extends Area2D

@export var popup_scene: PackedScene = preload("res://popupTile.tscn")  # Ensure this is the correct path

func _ready():
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	print("Something entered:", body.name)
	if body.is_in_group("player"):  # Check if the player entered
		print("Player entered trigger!")
		open_popup()
		var player = get_node("/root/main_world/player")
		player.set_movement(false)

func open_popup():
	var popup = popup_scene.instantiate()
	get_tree().current_scene.add_child(popup)  # Show the popup in the game
