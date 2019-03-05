#Player.gd
#Movement of player, controlled by which keys, and the speed
#Created by Zainab Parvin and Jake Gilbert

extends KinematicBody2D

#Speed that the player walks at
const SPEED = 130
#Bullet image
const bullet = preload("res://Assets/Weapons/Scenes/bullet.tscn")
#Variable representing the players position
var movedir = Vector2(0,0)

var spritedir = "down"

var inventory = false

var level

var items = 0

#The functions are called in the beginning 
func _physics_process(delta):
	controls_loop()
	movement_loop()
	shoot()
	spritedir_loop()
	
	if movedir != Vector2(0,0):
		switch_animation("walk")
	else:
		switch_animation("idle")
	
	if (Input.is_action_pressed("ui_inventory") && inventory == false):
		get_tree().paused = true
		$InventoryBackground.show()
		inventory = true
	
	level = get_tree().get_current_scene().get_filename()
	
	#make variable that if item is part of these nodes
	#items = min(items, 9)

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
	
	if (right):
		if sign($fire.position.x) == -1:
			$fire.position.x *= -1
	if (left):
		if sign($fire.position.x) == 1:
			$fire.position.x *= -1

#Function moves the player using the movedir variables and speed
func movement_loop():
	#Motion variable uses movedir variable's normalized method
		#According to Godot documentation: Normalizing a vector means reducing its length to 1 while preserving its direction. 
	var motion = movedir.normalized() * SPEED
	#Move and slide method moves the player along the vector
	move_and_slide(motion, Vector2(0,0))

func shoot():
	var bulleta = bullet.instance()
	var bulletCount = 0
	
	if (Input.is_action_just_pressed("ui_shoot") && bulletCount < 5):
		if sign($fire.position.x) == 1:
			bulleta.set_bullet_direction(1)
		else:
			bulleta.set_bullet_direction(-1)
		get_parent().add_child(bulleta)
		bulleta.position = $fire.global_position
		bulletCount += 1

func spritedir_loop():
	match movedir:
		Vector2(-1,0):
			spritedir = "left"
		Vector2(1,0):
			spritedir = "right"
		Vector2(0,-1):
			spritedir = "up"
		Vector2(0,1):
			spritedir = "down"

func switch_animation(animation):
	var newAnim = str(animation,spritedir)
	if $animChar.current_animation != newAnim:
		$animChar.play(newAnim)

func get_state():
	var save_dict = {
		pos = {
			x = position.x,
			y = position.y
		},
		speed = SPEED,
		moveDirection = movedir,
		spriteDirection = spritedir,
		isInventory = inventory,
		level = level
	}
	return save_dict

func load_state(data):
	for attribute in data:
		if attribute == "pos":
			position(Vector2(data["pos"]["x"], data["pos"]["y"]))
		else:
			set(attribute, data[attribute])
