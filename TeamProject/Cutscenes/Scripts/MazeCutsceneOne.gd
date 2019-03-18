#MazeCutsceneOne.gd
#Script for changing the scenes
#Created by Zainab Parvin

extends Node

#Function that changes the current scene to the puzzle scene when skip button pressed
func _on_SkipBtn_pressed():
	get_tree().change_scene("res://UI/Instructions/PuzzleTwoInstruction.tscn")

#Function that changes the current scene to the next cut scene
func _on_NextBtn_pressed():
	get_tree().change_scene("res://Cutscenes/Scenes/MazeCutsceneTwo.tscn")