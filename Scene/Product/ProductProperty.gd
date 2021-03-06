tool

extends PanelContainer

const InputPath := "MarginContainer/HBoxContainer/LineEdit"
const TitlePath := "MarginContainer/HBoxContainer/Label"
const EditButtonPath := "MarginContainer/HBoxContainer/EditButton"
enum PROP_TYPE {STRING = TYPE_STRING, INT = TYPE_INT}


export(String) var prop_name := "Name" setget set_prop_name
export(PROP_TYPE) var prop_type := TYPE_STRING

var prop_value := "Godot" setget set_prop_value

onready var title : Label = get_node(TitlePath)
onready var input : LineEdit = get_node(InputPath)
onready var edit_button : Button = get_node(EditButtonPath)

func _ready():
	match prop_type:
		TYPE_INT:
			prop_value = "0"
			input.placeholder_text = "0"
		TYPE_STRING:
			input.placeholder_text = "X"
		
	title.text = prop_name

func _on_EditButton_pressed():
	edit_button.hide()
	input.show()
	input.grab_focus()

func _on_Input_focus_exited():
	if input.text.empty():
		input.hide()
		edit_button.show()

func _on_LineEdit_text_changed(new_text: String) -> void:
	match prop_type:
		TYPE_INT:
			if not new_text.is_valid_integer():
				if new_text.empty():
					new_text = "0"
					input.text = ""
				else:
					input.text = prop_value
					new_text = prop_value
		TYPE_STRING:
			if new_text.strip_edges().empty():
				new_text = "Godot"
				
	prop_value = new_text

func set_prop_name(new_name) -> void:
	prop_name = new_name
	if Engine.editor_hint:
		get_node(TitlePath).text = prop_name
		
func set_prop_value(value) -> void:
	prop_value = value
	input.text = value
	if not input.text.empty():
		edit_button.hide()
		input.show()
	


	
	
	
