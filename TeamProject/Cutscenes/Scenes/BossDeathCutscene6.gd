#CatalystCutscene.gd
#Changes scene
#Created by Zainab Parvin

extends Node


#Changes scene to next cutscene
func _on_NextBtn_pressed():
	get_tree().change_scene("res://Levels/Scenes/LevelTwo/L2Map.tscn")