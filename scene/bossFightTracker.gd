extends Node2D

var pop_up_levels = false
var typing_levels = false
var logic_levels = false

var all_levels = [pop_up_levels, typing_levels, logic_levels]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func check_completed_level(a:int):
	return all_levels[0][a-1] && all_levels[1][a-1] && all_levels[2][a-1]
