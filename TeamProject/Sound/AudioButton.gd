extends CheckButton

onready var Audio = get_node("/root/Player")
var on = true

func _ready():
	pass

func _on_CheckButton_pressed():
	if (on == true):
		Audio.stop_playing()
		on = false
	elif (on == false):
		Audio._ready()
		on = true
	else:
		Audio._ready()
		on = true