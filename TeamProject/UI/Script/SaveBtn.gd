extends Button

onready var Save = get_node("/root/Save")

func _on_SaveBtn_pressed():
	Save.save_game()