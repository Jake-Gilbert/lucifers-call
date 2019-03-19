extends Node

export (String, FILE, "*.tscn") var nextScene

func _on_NextBtn_pressed():
	get_tree().change_scene(nextScene)