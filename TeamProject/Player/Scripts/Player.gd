extends KinematicBody2D

#Speed that the player walks at
const SPEED = 40
#Variable representing the players position
var movedir = Vector2(0,0)

#The functions are called in the beginning 
func _physics_process(delta):
	controls_loop()
	movement_loop()


#Function that says if this key pressed then player should move in this direction
func controls_loop():
	#Declared variable holds the action for which key is pressed
		#E.g. if left key is pressed on keyboard then stored in left variable
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	
	#Moving in x direction, use left and right keys
	#Moving in y direction, use up and down keys
	movedir.x = -int(left) + int(right)
	movedir.y = -int(up) + int(down)

#Function moves the player using the movedir variables and speed
func movement_loop():
	#Motion variable uses movedir variable's normalized method
		#According to Godot documentation: Normalizing a vector means reducing its length to 1 while preserving its direction. 
	var motion = movedir.normalized() * SPEED
	#Move and slide method moves the player along the vector
	move_and_slide(motion, Vector2(0,0))