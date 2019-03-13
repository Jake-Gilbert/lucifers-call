#L1Map.gd
#
#

extends Node2D

var doorDeleted = false
var playerInside = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$L1RoomA.hide()
	set_process(true)
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	
	var bodiesCollision = $L1Hallway/RoomA.get_overlapping_bodies()
	
	for body in bodiesCollision:
		if body.name == "Player" && doorDeleted == false:
			$L1Hallway/DoorL1A.queue_free()
			doorDeleted = true
	pass

func _on_RoomAreaA_body_entered(body):
	if body.name == "Player":
		$L1RoomA.show()
		playerInside = true


func _on_RoomAreaA_body_exited(body):
	if body.name == "Player":
		$L1RoomA.hide()
		playerInside = false
