#ControlBlock.gd
#Created by Faly Richou and Zainab Parvin
#Reformated by Rebekah

extends "BlockTemplateV.gd"

func _ready():
	id = "CB"
	set_physics_process(true)
#Once the red puzzle block enters the goal then the puzzle is completed and hte scene is changed
func _on_Goal_body_entered(body):
	if body.name == "BlockMain":
		Global_SceneSwitch.reload_last_saved()
		#L1Map._deferred_goto_scene("res://Levels/Scenes/LevelOne/L1Map.tscn")
		#L1Map.goto_scene("res://Levels/Scenes/LevelOne/L1Map.tscn")
#		get_tree().change_scene("res://Levels/Scenes/LevelOne/L1Map.tscn")
#		get_tree().change_scene("res://Levels/Scenes/LevelOne.tscn")
