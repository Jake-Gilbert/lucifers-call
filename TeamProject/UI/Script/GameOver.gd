#GameOver.gd
#
#Created by Zainab Parvin

extends Panel

func _ready():
	$VBoxContainer/Sprite/AnimationPlayer.play("death")

func _on_MenuScreen_pressed():
	get_tree().change_scene("res://UI/Scenes/TitleScreen.tscn")

func _on_Exit_pressed():
	get_tree().quit()
