#HUD.gd
#
#Created by Zainab Parvin

extends Panel

func _ready():
	get_node("PauseBtn").connect("pressed", self, "_on_PauseBtn_pressed")
	pass

func _on_PauseBtn_pressed():
	get_tree().paused = true

func _on_ExitBtn_pressed():
	get_tree().quit()

func _on_ResumeBtn_pressed():
	get_tree().paused = false

func _on_Inventory_Button_pressed():
	Global_SceneSwitch.save_current_scene()
	get_tree().change_scene("res://inventoryUI/Scenes/Scene_PlayerInventory.tscn")