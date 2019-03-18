#MazeCutsceneThree.gd
#Script for changing the scenes
#Created by Zainab Parvin

extends Node

#Function for changing to the next cut scene
func _on_NextBtn_pressed():
	get_tree().change_scene("res://Cutscenes/Scenes/MazeCutsceneFour.tscn")
