extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass
	

func _enter_tree() -> void:
	print(get_node("MazeTileMap/flag")) 
	var flag = get_node("MazeTileMap/flag")
	if flag:
		print("flag has connected")
		flag.connect("won_changed",Callable(self, "_on_won_changed"))
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass		
	
func _on_won_changed(is_won: bool):
	print("checking")
	if is_won:
		print("You won!")
		
