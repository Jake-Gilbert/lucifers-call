#Code for enemies
#Features enemy death
#Created by Jake Gilbert
extends Area2D

# class member variables go here, for example:
# var a = 2
var location = 0
var speed = 6
var health = 4

var alive = true 

var velocity = Vector2()
var direction = 1
	# Called when the node is added to thse scene for the first time.
	# Initialization here

#Function that sets up the functions to be ran, in this case the physics process function.
func _ready():
	set_physics_process(true)

#Function allows enemy to lose health, if health is decreased to 0 the enemy is deleted
func lose_health():
	if (health != 0):
		health = health -1
		if (health == 0):
			queue_free()
#Function in real time that allows player to collide with enemy and take damage as a result
#Also sets the speed at which enemy follows the path
func _physics_process(delta):
	location += speed
	get_parent().set_offset(location)
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			body.lose_health()


