#CatalystCutsceneOne.gd
#Changes scene
#Created by Zainab Parvin

extends Node

export (String, FILE, "*.tscn") var nextScene

#Changes scene to next cutscene
func _on_NextBtn_pressed():
	get_tree().change_scene(nextScene)
	pass
#	get_tree().change_scene("res://Cutscenes/Scenes/CatalystCutsceneTwo.tscn")

#Changes scene to the puzzle so skips the rest of the cutscenes
func _on_SkipBtn_pressed():
	get_tree().change_scene("res://Levels/Scenes/LevelTwo/L2Map.tscn")
	pass # replace with function body

