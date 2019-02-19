extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var bodiesCollision = get_overlapping_bodies()
	
	for body in bodiesCollision:
		if body.name == "Player" && body.get("items") < 9:
			body.items += 1
			#print("Player has touched the key")
			queue_free()
			#print(bodiesCollision)
			#get_node("Player/InventoryBackground").itemList.insert(body)
			#print("body inserted")
			#$InventorySystem.itemList.insert(body)
	pass