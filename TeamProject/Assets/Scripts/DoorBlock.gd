#DoorBlock.gd
#Blocks the door and holds the puzzle
#Created by Zainab Parvin

extends Area2D

#Creates a variable called openPuzzle
#Allows any scene file to be declared
export (String, FILE, "*.tscn") var openPuzzle

func _ready():
	#$DoorBlockDialogue.hide()
	set_physics_process(true)

func _physics_process(delta):
	#Contain all the bodies that collisions will occur with
	#$DoorBlockDialogue/RichTextLabel.add_text()
	var bodiesCollision = get_overlapping_bodies()
	
	#Loops through the bodies in variable
	#If one called player then the scene will change to designated chosen scene
	for body in bodiesCollision:
		if body.name == "Player" and body.get("items") >= 1:
			$DoorBlockDialogue.hide()
			get_tree().change_scene(openPuzzle)
		elif body.name == "Player" and body.get("items") == 0:
			$DoorBlockDialogue.show()
		else:
			$DoorBlockDialogue.hide()
			#print("need the key")

func _on_DoorBlock_body_exited(body):
	$DoorBlockDialogue.hide()