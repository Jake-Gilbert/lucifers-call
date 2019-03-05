#Area2D.gd
#Created by Faly Richou and Zainab Parvin

extends Area2D

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var bodies = get_overlapping_areas()
	
	for body in bodies:
		if body.name == "NodeOne" || body.name == "NodeFour":
			print("Collision")
			body.queue_free()