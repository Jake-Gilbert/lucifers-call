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
func _ready():
	set_physics_process(true)

func lose_health():
	if (health != 0):
		health = health -1
		if (health == 0):
			queue_free()

func _physics_process(delta):
	location += speed
	get_parent().set_offset(location)
	var bodies = get_overlapping_areas()
	for body in bodies:
		if body.name == "Player":
			body.lose_health()


