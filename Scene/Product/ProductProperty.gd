tool

extends PanelContainer

const InputPath := "MarginContainer/HBoxContainer/LineEdit"
const TitlePath := "MarginContainer/HBoxContainer/Label"
const EditButtonPath := "MarginContainer/HBoxContainer/EditButton"

export(String) var prop_name := "Name" setget set_prop_name

var prop_value = "" setget set_prop_value

onready var title : Label = get_node(TitlePath)
onready var input : LineEdit = get_node(InputPath)
onready var edit_button : Button = get_node(EditButtonPath)

func _ready():
	title.text = prop_name

func _on_EditButton_pressed():
	edit_button.hide()
	input.show()
	input.grab_focus()

func _on_Input_focus_exited():
	if input.text.empty():
		input.hide()
		edit_button.show()

func _on_LineEdit_text_changed(new_text):
	prop_value = new_text

func set_prop_name(new_name):
	prop_name = new_name
	if Engine.editor_hint:
		get_node(TitlePath).text = prop_name
		
func set_prop_value(value):
	prop_value = value
	input.text = prop_value
	if not input.text.empty():
		edit_button.hide()
		input.show()
	


	
	
	