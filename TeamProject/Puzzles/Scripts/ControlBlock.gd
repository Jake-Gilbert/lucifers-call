#ControlBlock.gd
#Created by Faly Richou and Zainab Parvin
#Reformated by Rebekah

extends "BlockTemplateV.gd"

func _ready():
	id = "BHC"
	set_physics_process(true)
#Once the red puzzle block enters the goal then the puzzle is completed and hte scene is changed
func _on_Goal_body_entered(body):
	if body.name == "BlockMain":
		get_tree().reload_current_scene()
#		get_tree().change_scene("res://Levels/Scenes/LevelOne/L1Map.tscn")
#		get_tree().change_scene("res://Levels/Scenes/LevelOne.tscn")
