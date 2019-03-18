#Hannah
extends RichTextLabel

var ms = 0
var s = 60

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	if ms > 9:
		s -= 1
		ms = 0
	
	if s == 0:
		s = 0
		ms = 0
		get_tree().change_scene("res://UI/Scenes/GameOver.tscn")
	
	set_text(str(s))
	pass

func _on_ms_timeout():
	ms +=1
	pass