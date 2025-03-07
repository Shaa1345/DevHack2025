extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var timeLeft = $BossTimer.time_left;
	var min = roundi(timeLeft)/60
	var sec = roundi(timeLeft)%60
	
	$RichTextLabel.text = str(min)+"m "+str(sec)+"s" 
	
