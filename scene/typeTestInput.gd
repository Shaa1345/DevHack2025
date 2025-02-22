extends LineEdit


# Called when the node enters the scene tree for the first time.
func _ready():
	self.grab_focus()
	$GrabAttention.start(2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.caret_column = self.text.length()




func attention():
	self.grab_focus()
