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

func _on_AreaA_body_entered(body):
	if body.name == "Player":
		menuPopup.show()
		$Player.set_physics_process(false)
		$Player/animChar.stop(true)
		roomA = true
	pass # replace with function body

func _on_AreaA_body_exited(body):
	if body.name == "Player":
		roomA = false
	pass # replace with function body


func _on_AreaB_body_entered(body):
	if body.name == "Player":
		menuPopup.show()
		$Player.set_physics_process(false)
		$Player/animChar.stop(true)
		roomB = true
	pass # replace with function body


func _on_AreaB_body_exited(body):
	if body.name == "Player":
		roomB = false
	pass # replace with function body


func _on_AreaC_body_entered(body):
	if body.name == "Player":
		menuPopup.show()
		$Player.set_physics_process(false)
		$Player/animChar.stop(true)
		roomC = true
	pass # replace with function body


func _on_AreaC_body_exited(body):
	if body.name == "Player":
		roomC = false
	pass # replace with function body


func _on_AreaD_body_entered(body):
	if body.name == "Player":
		menuPopup.show()
		$Player.set_physics_process(false)
		$Player/animChar.stop(true)
		roomD = true
	pass # replace with function body


func _on_AreaD_body_exited(body):
	if body.name == "Player":
		roomD = false
	pass # replace with function body
