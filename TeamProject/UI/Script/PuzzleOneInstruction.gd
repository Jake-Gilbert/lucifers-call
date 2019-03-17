#PuzzleOneInstruction.gd
#Changes the scene from the puzzle to the instruction
#Created by Zainab Parvin

extends Node

#Changes the scene from the instructions to the first puzzle
func _on_StartBtn_pressed():
	get_tree().change_scene("res://Puzzles/Scenes/PuzzleR1.tscn")