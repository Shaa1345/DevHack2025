extends Node2D
signal closed_window


func window_closed() -> void:
	emit_signal("closed_window")
	hide()
	
