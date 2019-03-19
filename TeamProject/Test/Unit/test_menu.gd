extends "res://addons/gut/test.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var TitleScreen = preload("res://UI/Script/TitleScreen.gd")
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func test_play_clicked():
	var title = TitleScreen.new()
