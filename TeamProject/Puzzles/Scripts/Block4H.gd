#Block4H.gd
#Created by Faly Richou

extends KinematicBody2D

var isHere = false
var motion = Vector2()
#Edit made by Rebekah: this variable used to determine if block is clicked on
var pressed = false

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	#Check if block clicked on		
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and isHere:
		#If already clicked on become false
		if pressed:
			pressed = false
			#Return block to full colour when deselected
			$Sprite.modulate.a = 1.0
		#Else become true as block selected
		else:
			#Make block opque when selected
			$Sprite.modulate.a = 0.5
			pressed = true
	#If the block is selected and arrow keys pressed then move the block
	if pressed:
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
