#LoadInstructions.gd
#
#Created by Zainab Parvin

extends Node

func _ready():
	pass

func _on_Button_pressed():
	get_tree().change_scene("res://Player/Levels/Scenes/LevelOne/L1Map.tscn")