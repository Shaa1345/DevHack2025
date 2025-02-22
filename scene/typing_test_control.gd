extends Control

var word_label : RichTextLabel
var input_field : LineEdit

var paragraph : String = "import os\nimport time\nimport random\nimport logging\nlogging.basicConfig(filename='system_log.txt', level=logging.INFO)\ndef activate_firewall():\n    print(\"Activating firewall...\")\n    time.sleep(1)\n    logging.info(\"Firewall activated.\")\n    print(\"Firewall enabled.\\n\")\ndef run_antivirus_scan():\n    print(\"Scanning for malware...\")\n    time.sleep(2)\n    if random.choice([True, False]):\n        print(\"Malware detected! Removing...\")\n        logging.info(\"Malware removed.\")\n        return True\n    else:\n        print(\"No malware detected.\")\n        return False\ndef check_for_processes():\n    print(\"Checking processes...\")\n    suspicious_processes = [\"hacker_shell\", \"malicious_script\"]\n    found = False\n    for process in suspicious_processes:\n        if random.choice([True, False]):\n            print(f\"Suspicious process {process} found!\")\n            logging.warning(f\"Process {process} terminated.\")\n            found = True\n    return found\ndef secure_files():\n    print(\"Securing sensitive files...\")\n    time.sleep(1)\n    files = [\"user_data.txt\", \"private_docs.pdf\"]\n    for file in files:\n        logging.info(f\"Secured {file}.\")\n    print(\"Files secured.\\n\")\ndef block_hacker():\n    print(\"Blocking hacker...\")\n    activate_firewall()\n    run_antivirus_scan()\n    check_for_processes()\n    secure_files()\n    print(\"Hacker blocked!\\n\")\nif __name__ == \"__main__\":\n    block_hacker()"
var lines : Array = []
var current_line_index : int = 0
var current_word_index : int = 0
var current_word : String = ""

func _ready():
	word_label = $WordDisplay
	input_field = $UserInput

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
					line_display += "[color=green]" + words_in_line[word_index] + "[/color] "
				elif line_index == current_line_index and word_index == current_word_index:
					line_display += "[color=white]" + words_in_line[word_index] + "[/color] "
				else:
					line_display += words_in_line[word_index] + " "
			
			display_text += line_display + "\n"

	word_label.text = display_text.strip_edges()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		input_field.text = input_field.text.lstrip(" ")
		if input_field.text == lines[current_line_index].split(" ")[current_word_index]:
			current_word_index += 1
		else:
			pass
		
		input_field.clear()

		if current_word_index >= lines[current_line_index].split(" ").size():
			current_line_index += 1
			current_word_index = 0

			if current_line_index >= lines.size():
				input_field.hide()
			else:
				current_word = lines[current_line_index].split(" ")[current_word_index]
		
		update_word_display()
