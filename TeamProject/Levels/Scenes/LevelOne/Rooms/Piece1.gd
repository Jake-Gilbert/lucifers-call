extends Area2D

var picked1 = false

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var bodiesCollision = get_overlapping_bodies()
	
	for body in bodiesCollision:
		if body.name == "Player":
			picked1 = true
			print("picked up")
			queue_free()

	if picked1 == true:
		Global_Player.inventory_addItem("2")