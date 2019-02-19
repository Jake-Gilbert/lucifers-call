extends Button

onready var Save = get_node("/root/Save")

func _on_FakeBtn_pressed():
	Save.load_game()
