#PopupMenu.gd
#
#

extends PopupMenu

onready var player = get_node("../../Player")
onready var doorA = get_node("../../L1Hallway/DoorL1A")
onready var doorB = get_node("../../L1Hallway/DoorL1B")
onready var doorC = get_node("../../L1Hallway/DoorL1C")
onready var doorD = get_node("../../L1Hallway/DoorL1D")

func _ready():
	pass

func _on_NoBtn_pressed():
	player.set_physics_process(true)
	self.hide()


func _on_YesBtn_pressed():
	player.set_physics_process(true)
	if get_node("../../L1Hallway").roomA == true:
		doorA.queue_free()
	if get_node("../../L1Hallway").roomB == true:
		doorB.queue_free()
	if get_node("../../L1Hallway").roomC == true:
		doorC.queue_free()
	if get_node("../../L1Hallway").roomD == true:
		doorD.queue_free()
#	if get_node("../../../L1Map").roomA == true:
#		doorA.queue_free()
#	elif get_node("../../../L1Map").roomB == true:
#		doorB.queue_free()
#	elif get_node("../../../L1Map").roomC == true:
#		doorC.queue_free()
#	elif get_node("../../../L1Map").roomD == true:
#		doorD.queue_free()
	self.hide()