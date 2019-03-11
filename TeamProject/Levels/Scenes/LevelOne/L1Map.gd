extends Node2D

#do a boolean to say if its true then should delete if not dont
var doorDeleted = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_process(true)
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	
	var bodiesColliding = $L1Hallway/RoomA.get_overlapping_bodies()
	
	for body in bodiesColliding:
		if body.name == "Player" && doorDeleted == false:
			$L1Hallway/DoorL1A.queue_free()
			doorDeleted = true
		else:
			$L1RoomA.show()
	
	
	##for body in bodiesCollision:
	#	if body.name == "Player":
	#		print("player entered")
	
	pass
