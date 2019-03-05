#bullet.gd
#Created by Jake Gilbert

extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const SPEED = 100
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
	queue_free()
	pass # replace with function body
