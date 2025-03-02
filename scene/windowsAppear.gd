extends Sprite2D

var allWindows = []
var rng = RandomNumberGenerator.new()
var currIndex = 0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	allWindows.append_array($horizontal.get_children()) # + $vertical.get_children() + $web.get_children()
	allWindows.append_array($vertical.get_children())
	allWindows.append_array($web.get_children())
	for a in allWindows:
		a.z_index = 4
		a.hide()
	$ClockSpawnTimer.start(3)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawnWindow():
	var window = allWindows.pick_random()
	if(!window.visible):
		window.show();
	else:
		window.z_index = 4 if window.z_index == 3 else 4
