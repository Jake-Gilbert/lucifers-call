#Created by Zainab Parvin

extends Area2D

func _ready():
	set_physics_process(true)
	pass

func _physics_process(delta):
	var bodiesCollision = get_overlapping_bodies()
	
	for body in bodiesCollision:
		if body.name == "Player":
			$DeskDialogue.show() 
		else:
			$DeskDialogue.hide()

func _on_Desk_body_exited(body):
	$DeskDialogue.hide()
	pass
