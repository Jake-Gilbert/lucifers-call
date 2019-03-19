extends Camera2D

#Function that sets up the camera with corect coordinates.
func _process(delta):
	var pos = get_node("../Player").global_position - Vector2(0,16)
	var x = floor(pos.x / 720) * 720
	var y = floor(pos.y / 432) * 432
	global_position = Vector2(x, y)
#	pass