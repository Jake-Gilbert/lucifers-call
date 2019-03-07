extends Area2D

var diaShowing = false

func _ready():
	set_physics_process(true)
	pass
	
func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if Input.is_action_just_pressed("ui_select") && diaShowing == false && body.get_collision_mask_bit(1):
			get_parent().get_parent().get_node("Camera2D/NinePatchRect/text").set_text(get_node("Label").text)
			get_parent().get_parent().get_node("Camera2D/NinePatchRect").show()
			get_parent().get_parent().get_node("Camera2D/NinePatchRect").show()
			diaShowing = true
			get_parent().get_parent().get_node("Player").set_physics_process(false)
			print("touching bed")
		elif Input.is_action_just_pressed("ui_select") && diaShowing == true && body.get_collision_mask_bit(1):
			get_parent().get_parent().get_node("Camera2D/NinePatchRect").hide()
			get_parent().get_parent().get_node("Camera2D/NinePatchRect/text").clear()
			diaShowing = false
			get_parent().get_parent().get_node("Player").set_physics_process(true)


