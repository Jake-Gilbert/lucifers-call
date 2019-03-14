extends PopupMenu

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
#var player = get_tree().get("Player")
onready var player = get_node("../../Player")
onready var doorA = get_node("../../L1Hallway/DoorL1A")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_NoBtn_pressed():
	player.set_physics_process(true)
	self.hide()
	pass # replace with function body


func _on_YesBtn_pressed():
#	hallway.get_tree().get("DoorL1A").queue_free()
	player.set_physics_process(true)
	doorA.queue_free()
	self.hide()
	pass # replace with function body
