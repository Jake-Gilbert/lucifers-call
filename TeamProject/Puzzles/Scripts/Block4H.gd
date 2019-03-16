#Block4H.gd
#Created by Faly Richou

extends KinematicBody2D

var isHere = false
var motion = Vector2()
var enabled = false
var green = Color(0, 1, 0, 1)
var default = Color(1, 1, 1, 1)

func _ready():
	set_physics_process(true)

func _input(event):
	#If key 1 pressed and up and down keys pressed, body will move along Vector
	if event.is_action_pressed("leftMouse") && enabled == false && isHere == true:
		enabled = true
		get_node("Sprite").set_modulate(green)
	elif event.is_action_pressed("leftMouse") && enabled == true:
		enabled = false
		get_node("Sprite").set_modulate(default)

func _physics_process(delta):
	if (enabled == true):
		if Input.is_action_pressed("ui_left"):
			motion.x = -10
			move_and_collide(motion)
		elif Input.is_action_pressed("ui_right"):
			motion.x = 10
			move_and_collide(motion)
		else:
			motion.y = 0
			motion.x = 0

func _on_Area2D_mouse_entered():
	isHere = true
	pass

func _on_Area2D_mouse_exited():
	isHere = false
	pass
