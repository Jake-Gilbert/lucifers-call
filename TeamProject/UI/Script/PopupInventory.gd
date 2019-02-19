#PopupInventory.gd
#
#Created by Zainab Parvin

extends Node

var inventory = false
var open = false

func _on_Button_pressed():
	hide()
	get_tree().paused = false
	inventory = false