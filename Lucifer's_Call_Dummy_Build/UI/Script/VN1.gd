extends Node

func _ready():
	pass

func _on_Button_pressed():
	get_tree().change_scene("res://UI/Scenes/VN2.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://UI/Instructions/LoadInstructions.tscn")
