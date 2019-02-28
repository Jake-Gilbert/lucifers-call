#Switch.gd
#Created by Faly Richou

extends Sprite

var direction = "up"

func _ready():
	set_flip_h(true)
	set_flip_v(false)
	set_process(true)

func _process(delta):
	if Input.is_action_just_pressed('ui_right'):
		if is_flipped_h():
			direction = "down"
			set_flip_h(false)
			set_flip_v(true)
		else:
			direction = "up"
			set_flip_h(true)
			set_flip_v(false)