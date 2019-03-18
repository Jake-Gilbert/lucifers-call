extends StaticBody2D

export (String, FILE, "*.tscn") var openPuzzle


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_physics_process(true)
	pass

func _physics_process(delta):
	#Contain all the bodies that collisions will occur with
	var bodiesCollision = $Area2D.get_overlapping_bodies()
	
	for body in bodiesCollision:
		if body.name == "Player":
#			get_tree().get_root().add_child(scene)
			self.queue_free()
#			print("player entered")
#			get_tree().change_scene(openPuzzle)
