extends Node

var packed_scene = PackedScene.new()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func save_current_scene():
	packed_scene.pack(get_tree().get_current_scene())
	ResourceSaver.save("res://my_scene.tscn", packed_scene)

func reload_last_saved():
	var packed_scene = load("res://my_scene.tscn")
	
	var my_scene = packed_scene.instance()
	get_tree().change_scene("res://my_scene.tscn")
