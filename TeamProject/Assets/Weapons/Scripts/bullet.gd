#bullet.gd
#Created by Jake Gilbert

extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const SPEED = 300
var velocity = Vector2()
var direction = 1

func set_bullet_direction(dir):
	direction = dir
	if dir == -1:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false
	
func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)


func _on_VisibilityNotifier2D_screen_exited():
	self.queue_free()



func _on_bullet_body_entered(body):
	if   ("enemy" in body.name && body.getHealth() < 0) :		
		self.queue_free()
		body.dead()
		body.queue_free()
	elif ("enemy" in body.name && body.getHealth() >= 0):
		self.queue_free()
		body.setHealth()