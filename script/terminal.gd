extends Node

var password = "password"
var currTerminalInput
var currTerminalTitle
var terminalTitleText = 'user@localhost'
# Called when the node enters the scene tree for the first time.
func _ready():
	print("we printing!")
	currTerminalInput = $TerminalInput
	currTerminalTitle = $TerminalTitle
	print(currTerminalInput.name)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

func _on_line_edit_text_submitted(text: String):
	print("User entered: " + text)
	if(text == password ):
		print("congrats")
	else:	
		makeNewLine(text)

func makeNewLine(input: String):
	print("making new line")
	#replaces Terminal Input to text label
	currTerminalInput.clear()
	var replaceInputText = Label.new()
	replaceInputText.position = Vector2(currTerminalInput.position.x, currTerminalInput.position.y)
	replaceInputText.text = input
	add_child(replaceInputText)
	
	#moves curr terminal input down to act as new input line
	currTerminalInput.position = Vector2(currTerminalInput.position.x, currTerminalInput.position.y + 20)
	
	#making new label line
	var newTerminalTitle = Label.new()
	newTerminalTitle.position = Vector2(currTerminalTitle.position.x, currTerminalTitle.position.y + 10)
	newTerminalTitle.text = terminalTitleText
	add_child(newTerminalTitle)
	
