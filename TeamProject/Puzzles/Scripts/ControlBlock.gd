#ControlBlock.gd
#Created by Faly Richou and Zainab Parvin

extends KinematicBody2D

var isHere = false
var motion = Vector2()

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	#If key 1 pressed and up and down keys pressed, body will move along Vector
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and isHere == true:
		if Input.is_action_pressed("ui_down"):
			motion.y = 10
			move_and_collide(motion)
		elif Input.is_action_pressed("ui_up"):
			motion.y = -10
			move_and_collide(motion)
		else:
			motion.y = 0
			motion.x = 0
	pass

#Signal - if the body enters the goal then it will return to the scene where door is open
func _on_Goal_body_entered(body):
	#print("Win")
	if body.name == "BlockMain":
		get_tree().reload_current_scene()
#		get_tree().change_scene("res://Levels/Scenes/LevelOne/L1Map.tscn")
#		get_tree().change_scene("res://Levels/Scenes/LevelOne.tscn")

func _on_Area2D_mouse_entered():
	isHere = true
	pass

func _on_Area2D_mouse_exited():
	isHere = false
	pass
