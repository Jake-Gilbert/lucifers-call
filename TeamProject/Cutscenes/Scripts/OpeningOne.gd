#


extends Node

func _on_SkipBtn_pressed():
	get_tree().change_scene("res://UI/Instructions/LoadInstructions.tscn")


func _on_NextBtn_pressed():
	get_tree().change_scene("res://Cutscenes/Scenes/OpeningTwo.tscn")