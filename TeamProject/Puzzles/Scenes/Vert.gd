#Area2D.gd
#Created by Faly Richou and Zainab Parvin

extends Area2D

var hor = true

func _ready():
	set_physics_process(true)

func _input(event):
	if event.is_action_pressed("ui_select") && hor == true:
		hor = false
		rotate(1.57)
	elif event.is_action_pressed("ui_select") && hor == false:
		hor = true
		rotate(-1.57)
func _physics_process(delta):
	var bodies = get_overlapping_areas()
	
	for body in bodies:
		if hor == true && body.get_collision_layer_bit(7):
			get_parent().clear()
			body.queue_free()
		elif hor == false && body.get_collision_layer_bit(7):
			get_tree().change_scene("res://UI/Scenes/PuzzleFailed.tscn")