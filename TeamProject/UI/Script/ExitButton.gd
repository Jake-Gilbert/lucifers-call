#ExitButton.gd
#Code for exit button, when pressed it the whole program closes
#Created by Zainab Parvin

extends VBoxContainer

func _ready():
	pass

#When exit button pressed, closes whole program
func _on_Exit_pressed():
	#get_node("ConfirmationDialog").show()
	get_tree().quit()