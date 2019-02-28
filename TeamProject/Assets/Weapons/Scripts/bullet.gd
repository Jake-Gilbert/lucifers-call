#Code for bullet projectiles
#Created by Jake Gilbert

extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const SPEED = 100
var velocity = Vector2()
var direction = 1

var hit = false


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
	
#Whenever enemy hit by bullet this func is triggered
func  _on_bullet_body_entered(body):
	#var bodies = get.overlapping.areas
	#for bodies in bodies
		if "enemy" in body.name :
			if(body.getHealth() <= 1):
				self.queue_free()
				body.dead()
				body.queue_free()
			
			else:
				body.loseHealth()
				self.queue_free()

