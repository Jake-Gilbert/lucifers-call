#Code for enemies
#Features enemy death
#Created by Jake Gilbert
extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
const GRAVITY = 10
const SPEED = 30
const FLOOR = Vector2(0, -1)
var health = 3
var alive = true 

var velocity = Vector2()
var direction = 1
	# Called when the node is added to thse scene for the first time.
	# Initialization here
func dead():
	alive = false
	$Sprite.hide()
	velocity = Vector2(0, 0)
	
func loseHealth():
	health -= 1
func getHealth():
	return health
func _physics_process(delta):
	velocity.x   = SPEED * direction
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity, FLOOR)
	
	if is_on_wall():
			direction = direction * -1

			
