extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var playerInside

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	self.hide()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

#func _on_RoomAreaA_body_entered(body):
#	if body.name == "Player":
#		show()
#		playerInside = true
#
#func _on_RoomAreaA_body_exited(body):
#	if body.name == "Player":
#		hide()
#		playerInside = false

func _on_RoomAreaA_body_entered(body):
	if body.name == "Player":
		self.show()
		playerInside = true
	pass # replace with function body


func _on_RoomAreaA_body_exited(body):
	if body.name == "Player":
		self.hide()
		playerInside = false
	pass # replace with function body
