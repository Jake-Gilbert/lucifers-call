extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var menuPopup
var player
var playerAnim

var roomA = false
var roomB = false
var roomC = false
var roomD = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	menuPopup = get_parent().get_node("Camera2D/PopupMenu")
	
	player = get_parent().get_node("Player")
	playerAnim = get_parent().get_node("Player/animChar")
	
	$DoorL1A/AreaA.connect("body_entered", self, "_on_AreaA_body_entered")
	$DoorL1A/AreaA.connect("body_exited", self, "_on_AreaA_body_exited")
	
	$DoorL1B/AreaB.connect("body_entered", self, "_on_AreaB_body_entered")
	$DoorL1B/AreaB.connect("body_exited", self, "_on_AreaB_body_exited")
	
	$DoorL1C/AreaC.connect("body_entered", self, "_on_AreaC_body_entered")
	$DoorL1C/AreaC.connect("body_exited", self, "_on_AreaC_body_exited")
	
	$DoorL1D/AreaD.connect("body_entered", self, "_on_AreaD_body_entered")
	$DoorL1D/AreaD.connect("body_exited", self, "_on_AreaD_body_exited")

func _popupAndStop():
	menuPopup.show()
	player.set_physics_process(false)
	playerAnim.stop(true)

func _on_AreaA_body_entered(body):
	if body.name == "Player" && L1Map.mazePuzzle == false:
		L1Map.mazePuzzle = true
		roomA= true
		_popupAndStop()
	else:
		pass

func _on_AreaA_body_exited(body):
	if body.name == "Player":
		roomA = false

func _on_AreaB_body_entered(body):
	if body.name == "Player":
		_popupAndStop()
		roomB = true

func _on_AreaB_body_exited(body):
	if body.name == "Player":
		roomB = false

func _on_AreaC_body_entered(body):
	if body.name == "Player" && L1Map.flipPuzzle == false:
		L1Map.flipPuzzle = true
		roomC= true
		_popupAndStop()
	else:
		pass

func _on_AreaC_body_exited(body):
	if body.name == "Player":
		roomC = false

func _on_AreaD_body_entered(body):
	if body.name == "Player" && L1Map.ghostCombat == false:
		L1Map.ghostCombat = true
		_popupAndStop()
		roomD = true

func _on_AreaD_body_exited(body):
	if body.name == "Player":
		roomD = false