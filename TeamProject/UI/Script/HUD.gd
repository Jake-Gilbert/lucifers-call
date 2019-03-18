#HUD.gd
#
#Created by Zainab Parvin

extends Panel

func _ready():
	get_node("PauseBtn").connect("pressed", self, "_on_PauseBtn_pressed")
	pass
#Pauses game if pressed
func _on_PauseBtn_pressed():
	get_tree().paused = true
#Exits game if pressed
func _on_ExitBtn_pressed():
	get_tree().quit()
#Resumes game once pressed
func _on_ResumeBtn_pressed():
	get_tree().paused = false
#Opens inventory screen
func _on_Inventory_Button_pressed():
	get_tree().change_scene("res://inventoryUI/Scenes/Scene_PlayerInventory.tscn")