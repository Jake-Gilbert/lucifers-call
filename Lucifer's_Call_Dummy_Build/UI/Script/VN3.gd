extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	pass


func _on_Button_pressed():
	get_tree().change_scene("res://UI/Scenes/VN4.tscn")
