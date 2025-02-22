extends Control
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$BossTimer.start(5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_boss_timer_timeout() -> void:
	$DesktopBackground.texture=ResourceLoader.load("res://art/boss_fight/blueScreen.png")
	$DesktopBackground.apply_scale(Vector2(0.707, 0.705))
	$Camera2D/Taskbar.hide()
