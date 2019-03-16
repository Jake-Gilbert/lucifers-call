extends Node

var packed_scene = PackedScene.new()

func save_current_scene():
	packed_scene.pack(get_tree().get_current_scene())
	ResourceSaver.save("res://my_scene.tscn", packed_scene)

func reload_last_saved():
	var packed_scene = load("res://my_scene.tscn")
	
	var my_scene = packed_scene.instance()
	add_child(my_scene)