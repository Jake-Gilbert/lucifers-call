#HUD.gd
#
#Created by Zainab Parvin

extends Panel

func _ready():
	get_node("HBoxContainer/PauseBtn").connect("pressed", self, "_on_PauseBtn_pressed")
	pass

func _on_PauseBtn_pressed():
	get_tree().paused = true

func _on_ExitBtn_pressed():
	get_tree().quit()

func _on_ResumeBtn_pressed():
	get_tree().paused = false
	pass
