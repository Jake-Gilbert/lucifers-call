#MazeCutsceneFive.gd
#Script for changing the scenes
#Created by Zainab Parvin

extends Node

#Function for changing the scene to the instruction scene
func _on_NextBtn_pressed():
	get_tree().change_scene("res://Puzzles/Scenes/PuzzleR1A.tscn")