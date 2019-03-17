#PuzzleTwoInstruction.gd
#Changes the scene to the puzzle from instruction
#Created by Zainab Parvin

extends Node

#After start button pressed changes to the puzzle scene
func _on_StartBtn_pressed():
	get_tree().change_scene("res://Puzzles/Scenes/PuzzleR1A.tscn")