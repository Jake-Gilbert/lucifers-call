#LevelComplete.gd
#Once the player reaches the door area to lead to next room, transferred there
#Created by Zainab Parvin

extends Area2D

#Creates a variable called changeLevels
#Allows any scene file to be declared
export (String, FILE, "*.tscn") var changeLevels

func _physics_process(delta):
	#Contain all the bodies that collisions will occur with
	var bodiesCollision = get_overlapping_bodies()
	
	#Loops through the bodies in variable
	#If one called player then the scene will change to designated chosen scene
	for body in bodiesCollision:
		if body.name == "Player":
			get_tree().change_scene(changeLevels)