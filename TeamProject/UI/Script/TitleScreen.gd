#TileScreen.gd
#Code for title screen, start button - starts game, exit button - closes program
#Created by Zainab Parvin
extends Node

#func _ready():
	#Below statement says when title screen open the start button will be selected at start of scene
	#$MarginContainer/VBoxContainer/VBoxContainer/Start.gra
	#pass

#If user either hovers over start or exit button then it will show another image
func _physics_process(delta):
	if $MarginContainer/VBoxContainer/VBoxContainer/Start.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/Start.grab_focus()
		
	if $MarginContainer/VBoxContainer/VBoxContainer/Exit.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/Exit.grab_focus()

#When start button pressed changes scene into Level One
#Function is connected to button via signal
func _on_Start_pressed():
	get_tree().change_scene("res://Levels/Scenes/LevelOne.tscn")

#When exit button pressed then the whole program closes
#Function is connected to button via signal
func _on_Exit_pressed():
	get_tree().quit()