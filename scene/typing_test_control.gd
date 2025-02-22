extends Control

var word_label : RichTextLabel
var input_field : LineEdit

var paragraph : String = "import random, logging\nlogging.basicConfig(filename='system_log.txt', level=logging.INFO)\ndef block_hacker():\n>>>> print(\"Firewall activated.\\n\")\n>>>> logging.info(\"Firewall enabled.\")\n>>>> if random.choice([True, False]):\n>>>> >>>> print(\"Malware removed.\\n\")\n>>>> >>>> logging.info(\"Malware removed.\")\n>>>> if random.choice([True, False]):\n>>>> >>>> process = random.choice([\"hacker_shell\", \"malicious_script\"])\n>>>> >>>> print(f\"Terminated {process}.\\n\")\n>>>> >>>> logging.warning(f\"Process {process} terminated.\")\n>>>> print(\"Files secured.\\n\")\n>>>> logging.info(\"Sensitive files secured.\")\n>>>> print(\"Hacker blocked!\\n\")\nif __name__ == \"__main__\":\n>>>> block_hacker()\n"
var lines : Array = []
var current_line_index : int = 0
var current_word_index : int = 0
var current_word : String = ""

func _ready():
	word_label = $ColorRect/WordDisplay
	input_field = $ColorRect/UserInput

	lines = paragraph.split("\n")

	update_word_display()

	current_word = lines[current_line_index].split(" ")[current_word_index]

	input_field.connect("text_changed", Callable(self, "_on_input_changed"))

func update_word_display():
	var display_text = ""
	
	for line_index in range(current_line_index + 1):  # Only show lines up to the current line
		if(line_index < lines.size()):
			var line = lines[line_index]
			var words_in_line = line.split(" ")
			
			var line_display = ""
			for word_index in range(words_in_line.size()):
				if line_index < current_line_index or (line_index == current_line_index and word_index < current_word_index):
					line_display += "[color=pink]" + words_in_line[word_index] + "[/color] "
				elif line_index == current_line_index and word_index == current_word_index:
					line_display += "[color=white][b][i]" + words_in_line[word_index] + "[/i][/b][/color] "
				else:
					line_display += words_in_line[word_index] + " "
			
			display_text += line_display + "\n"

	word_label.text = display_text.strip_edges()

func _input(event):
	if event.is_action_pressed("ui_accept") && input_field.caret_column == input_field.text.length():
		input_field.text = input_field.text.strip_edges()
		if input_field.text == lines[current_line_index].split(" ")[current_word_index]:
			print((lines[current_line_index].split(" ")[current_word_index]))
			current_word_index += 1
			input_field.clear()
		else:
				var allText = input_field.text.strip_edges().split(" ")
				input_field.text = input_field.text.strip_edges()
		

		if current_word_index >= lines[current_line_index].split(" ").size():
			current_line_index += 1
			current_word_index = 0

			if current_line_index >= lines.size():
				get_tree().change_scene_to_file("res://scene/goodEnding.tscn")
			else:
				current_word = lines[current_line_index].split(" ")[current_word_index]
		
		update_word_display()
