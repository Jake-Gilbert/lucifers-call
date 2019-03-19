extends Area2D

var keypicked = false

func _ready():
	set_physics_process(true)
	print ("There is a key on the floor!")

func _physics_process(delta):
	var bodiesCollision = get_overlapping_bodies()
	
	for body in bodiesCollision:
		if body.name == "Player":
			keypicked = true
			print("key picked up")
			print ("No key anymore")
			queue_free()

	if keypicked == true:
		Global_Player.inventory_addItem("1")