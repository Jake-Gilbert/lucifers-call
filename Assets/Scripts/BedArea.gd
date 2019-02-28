#BedArea.gd
#Created by Jake Gilbert

extends Area2D

var inside = false

func _process(delta):
	if(inside==true && Input.is_action_pressed("ui_accept")):
		$BedLabel.visible = true
	elif(inside==true && Input.is_action_pressed("ui_cancel")):
		$BedLabel.visible = false
		#if(inside && Input.is_action_pressed("ui_accept")):
			#$BedLabel.visible = false
	#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_BedArea_body_entered(body):
	inside = true


func _on_BedArea_body_exited(body):
	inside = false
	$BedLabel.visible = false
