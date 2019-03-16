#bullet.gd
#Created by Jake Gilbert

extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const SPEED = 600
var velocity = Vector2()
var directionX = 1
var directionY = 1

func _ready():
	set_physics_process(true)

func set_bullet_direction(dirX, dirY):
	directionX = dirX
	directionY = dirY
	if dirX == -1 && dirY == 0:
		$Sprite.flip_h = true
		$Sprite.rotation_degrees = 0
	elif dirX == 1 && dirY == 0:
		$Sprite.flip_h = false
		$Sprite.rotation_degrees = 0
	if dirY == 1 && dirX == 0:
		$Sprite.rotation_degrees = 90
	elif dirY == -1 && dirX == 0:
		$Sprite.rotation_degrees = -90

	
func _physics_process(delta):
	var bodies = get_overlapping_areas()
	for body in bodies:
		if body.name == "enemy":
			body.lose_health()
			print ("hit")
			queue_free()
	velocity.x = SPEED * delta * directionX
	velocity.y = SPEED * delta * directionY
	translate(velocity)


func _on_VisibilityNotifier2D_screen_exited():
	self.queue_free()
	



