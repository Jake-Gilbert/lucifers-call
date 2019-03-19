#TileScreen.gd
#Code for title screen, start button - starts game, exit button - closes program
#Created by Zainab Parvin

extends Node

onready var Save = get_node("/root/Save")

#func _ready():
	#Below statement says when title screen open the start button will be selected at start of scene
	#$MarginContainer/VBoxContainer/VBoxContainer/Start.gra
	#pass

#When start button pressed changes scene into Level One
#Function is connected to button via signal
func _on_Start_pressed():
	get_tree().change_scene("res://Cutscenes/Scenes/OpeningOne.tscn")

#When exit button pressed then the whole program closes
#Function is connected to button via signal
func _on_Exit_pressed():
	get_tree().quit()

func _on_Load_pressed():
	Global_SceneSwitch.reload_last_saved()

func _on_Help_pressed():
	get_tree().change_scene("res://UI/Instructions/HelpInstructions.tscn")


func _on_Settings_pressed():
	get_tree().change_scene("res://UI/Scenes/SettingsMenu.tscn")
