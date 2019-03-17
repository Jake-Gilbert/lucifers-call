#GameOver.gd
#
#Created by Zainab Parvin

extends Panel

func _ready():
	$VBoxContainer/Sprite/AnimationPlayer.play("death")
#Redirects player to the menu when clicked
func _on_MenuScreen_pressed():
	get_tree().change_scene("res://UI/Scenes/TitleScreen.tscn")
#Exits the game
func _on_Exit_pressed():
	get_tree().quit()
#Retries the game from a scene
func _on_Retry_pressed():
	get_tree().change_scene("res://Puzzles/Scenes/Puzzle1.tscn")
