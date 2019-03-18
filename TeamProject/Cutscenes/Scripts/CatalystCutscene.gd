#CatalystCutscene.gd
#Changes scene
#Created by Zainab Parvin

extends Node

export (String, FILE, "*.tscn") var nextScene

#Changes scene to next cutscene
func _on_NextBtn_pressed():
	get_tree().change_scene(nextScene)