#L1Map.gd
#
#

extends Node2D

var doorDeleted = false
var menuPopup

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	menuPopup = get_node("Camera2D/PopupMenu")
	pass

func _on_RoomA_body_entered(body):
	if body.name == "Player":
		print(true)
		menuPopup.show()
		$Player.set_physics_process(false)
