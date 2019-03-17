#L1Map.gd
#
#

extends Node2D

var doorDeleted = false
var menuPopup
var roomA = false
var roomB = false
var roomC = false
var roomD = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	menuPopup = get_node("Camera2D/PopupMenu")
	pass
#Function that activates when the player enters one of the 4 rooms in hallway
func _on_AreaA_body_entered(body):
	if body.name == "Player":
		menuPopup.show()
		$Player.set_physics_process(false)
		$Player/animChar.stop(true)
		roomA = true
	pass # replace with function body
#Makes the room not visisble when exited
func _on_AreaA_body_exited(body):
	if body.name == "Player":
		roomA = false
	pass # replace with function body

#Function that enters whenever player tries to enter one of the 4 rooms in hallway
func _on_AreaB_body_entered(body):
	if body.name == "Player":
		menuPopup.show()
		$Player.set_physics_process(false)
		$Player/animChar.stop(true)
		roomB = true
	pass # replace with function body

#Makes the room not visisble when exited
func _on_AreaB_body_exited(body):
	if body.name == "Player":
		roomB = false
	pass # replace with function body


#Function that enters whenever player tries to enter one of the 4 rooms in hallway
func _on_AreaC_body_entered(body):
	if body.name == "Player":
		menuPopup.show()
		$Player.set_physics_process(false)
		$Player/animChar.stop(true)
		roomC = true
	pass # replace with function body

#Makes the room not visisble when exited
func _on_AreaC_body_exited(body):
	if body.name == "Player":
		roomC = false
	pass # replace with function body

#Function that enters whenever player tries to enter one of the 4 rooms in hallway
func _on_AreaD_body_entered(body):
	if body.name == "Player":
		menuPopup.show()
		$Player.set_physics_process(false)
		$Player/animChar.stop(true)
		roomD = true
	pass # replace with function body

#Makes the room not visisble when exited
func _on_AreaD_body_exited(body):
	if body.name == "Player":
		roomD = false
	pass # replace with function body
