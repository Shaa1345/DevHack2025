extends Control
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	$timeDisp/BossTimer.start(480)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func game_over() -> void:
	$DesktopBackground.texture=ResourceLoader.load("res://art/boss_fight/blueScreen.png")
	$DesktopBackground.apply_scale(Vector2(0.707, 0.705))
	$AnimationPlayer.advance(480)
	$AnimationPlayer/RichTextLabel.size=Vector2($AnimationPlayer/RichTextLabel.size.x, 9)
	$Taskbar.hide()
	$WindowClosingMinigame/Camera2D/windows.hide()
	$TypingTest/ColorRect.hide()
	$timeDisp.hide()
	
