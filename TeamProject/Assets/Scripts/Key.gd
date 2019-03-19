extends Area2D

var keypicked = false

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var bodiesCollision = get_overlapping_bodies()
	
	for body in bodiesCollision:
		if body.name == "Player":
			keypicked = true
			print("key picked up")
			queue_free()
			Global_Player.inventory_addItem("1")

	if keypicked == true: