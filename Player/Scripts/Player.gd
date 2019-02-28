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
	
	level = get_tree().get_current_scene().get_filename()
	
#	if (Input.is_action_pressed("ui_inventory") && inventory == false):
#		get_tree().paused = true
#		get_tree().change_scene("res://inventoryUI/Scenes/Scene_PlayerInventory.tscn")
#	else:
#		get_tree().paused = false

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
		level = level
	}
	return save_dict

func load_state(data):
	for attribute in data:
		if attribute == "pos":
			position(Vector2(data["pos"]["x"], data["pos"]["y"]))
		else:
			set(attribute, data[attribute])

func _on_SaveBtn_pressed():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for i in save_nodes:
		var node_data = i.call("save");
		save_game.store_line(to_json(node_data))
	save_game.close()

func _on_LoadBtn_pressed():
    var save_game = File.new()
    if not save_game.file_exists("user://save_game.save"):
        return # Error! We don't have a save to load.

    # We need to revert the game state so we're not cloning objects during loading. This will vary wildly depending on the needs of a project, so take care with this step.
    # For our example, we will accomplish this by deleting savable objects.
    var save_nodes = get_tree().get_nodes_in_group("Persist")
    for i in save_nodes:
        i.queue_free()

    # Load the file line by line and process that dictionary to restore the object it represents
    save_game.open("user://savegame.save", File.READ)
    while not save_game.eof_reached():
        var current_line = parse_json(save_game.get_line())
        # First we need to create the object and add it to the tree and set its position.
        var new_object = load(current_line["filename"]).instance()
        get_node(current_line["parent"]).add_child(new_object)
        new_object.position = Vector2(current_line["pos_x"], current_line["pos_y"])
        # Now we set the remaining variables.
        for i in current_line.keys():
            if i == "filename" or i == "parent" or i == "pos_x" or i == "pos_y":
                continue
            new_object.set(i, current_line[i])
    save_game.close()
	

