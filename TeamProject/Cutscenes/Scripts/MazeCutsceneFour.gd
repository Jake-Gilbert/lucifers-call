#MazeCutsceneFour.gd
#Changes scene
#Created by Zainab Parvin

extends Node

#Function to change scene from current to the next cut scene
func _on_NextBtn_pressed():
	get_tree().change_scene("res://Cutscenes/Scenes/MazeCutsceneFive.tscn")