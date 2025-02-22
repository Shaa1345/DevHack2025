extends Node

var password = "asDdfEn5VkamHkkAkCjKsssSlDlfkCalskdjfashnsGddIfRLdYlPmOnPoSd"
var currTerminalInput
var currTerminalTitle
var terminalTitleText = "PS C:\\Users\\Code> "
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
	var replaceInputText = currTerminalTitle.duplicate()
	replaceInputText.position = Vector2(currTerminalTitle.position.x + 17, currTerminalTitle.position.y)
	replaceInputText.text = input
	#var dynamic_font = replaceInputText.get_font("font").duplicate()
	#dynamic_font.size = 10
	#replaceInputText.set("theme_override_font_sizes/font_size", 10)
	#replaceInputText.add_theme_font_override(dynamic_font)
	#replaceInputText.font_size = 3
	add_child(replaceInputText)
	#var labelInputFont = replaceInputText.get_font("font")
   
	
	#moves curr terminal input down to act as new input line
	currTerminalInput.position = Vector2(currTerminalInput.position.x, currTerminalInput.position.y + 15)
	
	#making new label line
	var newTerminalTitle = currTerminalTitle.duplicate()
	newTerminalTitle.position = Vector2(currTerminalTitle.position.x, currTerminalTitle.position.y + 15)
	newTerminalTitle.text = terminalTitleText
	#newTerminalTitle.set("theme_override_font_sizes/font_size", 4)
	#newTerminalTitle.font_size = 10
	add_child(newTerminalTitle)
	currTerminalTitle = newTerminalTitle
	
	
