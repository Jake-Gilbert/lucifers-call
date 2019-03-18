#TileScreen.gd
#Code for title screen, start button - starts game, exit button - closes program
#Created by Zainab Parvin

extends Node

onready var Save = get_node("/root/Save")

#func _ready():
	#Below statement says when title screen open the start button will be selected at start of scene
	#$MarginContainer/VBoxContainer/VBoxContainer/Start.gra
	#pass

#If user either hovers over start or exit button then it will show another image
func _physics_process(delta):
	if $VBoxContainer/Start.is_hovered() == true:
		$VBoxContainer/Start.grab_focus()
	
	if $VBoxContainer/Exit.is_hovered() == true:
		$VBoxContainer/Exit.grab_focus()
	
	if $VBoxContainer/Load.is_hovered() == true:
		$VBoxContainer/Load.grab_focus()
	
	if $VBoxContainer/Settings.is_hovered() == true:
		$VBoxContainer/Settings.grab_focus()

#When start button pressed changes scene into Level One
#Function is connected to button via signal
func _on_Start_pressed():
	#get_tree().change_scene("res://Levels/Scenes/LevelOneWithDoor.tscn")
	get_tree().change_scene("res://UI/Scenes/VN1.tscn")

#When exit button pressed then the whole program closes
#Function is connected to button via signal
func _on_Exit_pressed():
	get_tree().quit()

func _on_Settings_pressed():
	pass # replace with function body

func _on_Load_pressed():
	Global_SceneSwitch.reload_last_saved()
#	Save.load_game()
	#print("Red load button clicked")
