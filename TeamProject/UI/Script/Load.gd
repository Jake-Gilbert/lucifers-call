extends Button

onready var Save = get_node("/root/Save")

func _on_Button_pressed():
	print("clicked on actual button")
	Save.load_game()