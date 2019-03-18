#GameOver.gd
#
#Created by Zainab Parvin

extends Panel
#Plays the death animation visible on screen
func _ready():
	$VBoxContainer/Sprite/AnimationPlayer.play("death")
#Takes player back to menu
func _on_MenuScreen_pressed():
	get_tree().change_scene("res://UI/Scenes/TitleScreen.tscn")
#Exits game
func _on_Exit_pressed():
	get_tree().quit()
#Retries game from the puzzle
func _on_Retry_pressed():
	get_tree().change_scene("res://Puzzles/Scenes/Puzzle1.tscn")
