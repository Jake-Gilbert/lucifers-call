extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

#func _ready():
#	# Called when the node is added to the scene for the first time.
#	# Initialization here
#	pass
#Sets the coordinates for the camera in the scene
func _process(delta):
	var pos = get_node("../Player").global_position - Vector2(0,16)
	var x = floor(pos.x / 720) * 720
	var y = floor(pos.y / 432) * 432
	global_position = Vector2(x, y)
#	pass