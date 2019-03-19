#CatalystCutscene.gd
#Changes scene
#Created by Zainab Parvin

extends Node


#Changes scene to next cutscene
func _on_NextBtn_pressed():
	Global_SceneSwitch.reload_last_saved()
