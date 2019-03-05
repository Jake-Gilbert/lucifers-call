#Block4H.gd
#Created by Faly Richou

extends KinematicBody2D

var isHere = false
var motion = Vector2()

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	#If key 7 pressed and left and right keys pressed, body will move along Vector
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and isHere == true:
		if Input.is_action_pressed("ui_left"):
			motion.x = -10
			move_and_collide(motion)
		elif Input.is_action_pressed("ui_right"):
				motion.x = 10
				move_and_collide(motion)
		else:
			motion.y = 0
			motion.x = 0
	pass

func _on_Area2D_mouse_entered():
	isHere = true
	pass

func _on_Area2D_mouse_exited():
	isHere = false
	pass
