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
	add_child(my_scene)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass