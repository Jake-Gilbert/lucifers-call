#Created by Zainab Parvin

extends Area2D

func _ready():
	set_physics_process(true)
	pass

func _physics_process(delta):
	var bodiesCollision = get_overlapping_bodies()
	
	for body in bodiesCollision:
		if body.name == "Player":
			$BedDialogue.show() 
		else:
			$BedDialogue.hide()

func _on_BedArea_area_exited(area):
	$BedDialogue.hide()
	pass # replace with function body
