#Code for enemies
#Features enemy death
#Created by Jake Gilbert
extends Area2D

# class member variables go here, for example:
# var a = 2
var location = 0
var speed = 6
var health = 4
var spritedir = "Left"
var movedir = Vector2(0,0)

var alive = true 

var velocity = Vector2()
var direction = 1
	# Called when the node is added to thse scene for the first time.
	# Initialization here

#Function to prepare the methods to be run
func _ready():
	set_physics_process(true)
#Function to decrease health from the enemy
#If health = 0 then delete the enemy
func lose_health():
	if (health != 0):
		health = health -1
		$Sprite.modulate.a = $Sprite.modulate.a * 0.8
		if (health == 0):
			queue_free()

#Switches the animation of enemy to a different animation
func switch_animation(animation):
	var newAnim = str(animation,spritedir)
	if $AnimationPlayer.current_animation != newAnim:
		$AnimationPlayer.play(newAnim)
#Real time function  determines the direction of the enemy 
func _physics_process(delta):
	if get_parent().get_offset() < 275:
		spritedir = "Left"
	elif get_parent().get_offset() < 400:
		spritedir = "Down"
	elif get_parent().get_offset() < 675:
		spritedir = "Right"
	elif get_parent().get_offset() < 780:
		spritedir = "Up"
	elif get_parent().get_offset() >= 780:
		location = 0
	location += speed
	get_parent().set_offset(location)
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			body.lose_health()
	switch_animation("move")


