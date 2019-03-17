extends Area2D

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var bodiesCollision = get_overlapping_bodies()
	
	for body in bodiesCollision:
		var item_ID = "1"
		if body.name == "Player" && body.get("items") < 9:
			body.items += 1
			Global_Player.inventory_addItem("1")
<<<<<<< HEAD
			hide()
			Global_SceneSwitch.save_current_scene()
=======
>>>>>>> 98dd228996154472d1679b7c53c491dfe9646e8e
			queue_free()
	pass