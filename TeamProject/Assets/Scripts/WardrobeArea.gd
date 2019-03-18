#WardrobeArea.gd
#Created by Jake Gilbert

extends Area2D

var inside = false
#Displays text when the select key is pressed and the player is next to the object	
func _process(delta):
	if(inside && Input.is_action_pressed("ui_accept")):
		$WardrobeLabel.visible = true
	elif( Input.is_action_pressed("ui_cancel")):
		$WardrobeLabel.visible = false

func _on_WardrobeArea_body_entered(body):
	inside = true

func _on_WardrobeArea_body_exited(body):
	inside = false
	$WardrobeLabel.visible = false