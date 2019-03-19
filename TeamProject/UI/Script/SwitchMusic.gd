extends CheckBox

var files = []
func _ready():
	#var player = get_tree().get_root().get_node("AudioStreamPlayer")
	var player = get_node("/root/AudioStreamPlayer")
	
	var dir = Directory.new()
	if dir.open("res://Sound") == OK:
		dir.list_dir_begin()
		var file = dir.get_next()
		while (file != ""):
			if file.ends_with("ogg"):
				files.append(file)
			file = dir.get_next()
			
#		for i in ranges(file.size()):
#			self.add_item(files[i],i)
			
#		player.stream = load("res://Sound" + files[0])

func _on_CheckBox_pressed(ID):
#	if files.size > 0:
		var player = get_tree().get_root.get_node("AudioStreamPlayer")
		player.stream = load("res://Sound" + files[ID])