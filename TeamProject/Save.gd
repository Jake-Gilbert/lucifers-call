extends Node

const SAVE_PATH = "user://savegame.json"

#var data = {}

func _ready():
	load_game()

func save_game():
	var save_game = File.new()
	save_game.open(SAVE_PATH, File.WRITE)
	
	var save_dict = {}
	var nodes_to_save = get_tree().get_nodes_in_group("persistent")
	
	for node in nodes_to_save:
		save_dict[node.get_path()] = node.get_state()
	
	save_game.store_line(to_json(save_dict))
	save_game.close()

func load_game():
	var save_game = File.new()
	
	if not save_game.file_exists(SAVE_PATH):
		print("The file does not exist")
		return
	
	save_game.open(SAVE_PATH, File.READ)
	
	var dictionary = {}
	var keys = dictionary.keys()
	
	dictionary = parse_json(save_game.get_as_text())
	
	for node_path in keys:
		var node_data = dictionary[node_path]
		get_node(node_path).load_state(node_data)
	save_game.close()

#	while (!save_game.eof_reached()):
#		var data = {}
#		data = parse_json(save_game.get_line())
#		
#		for node_path in data.keys():
#			var node_data = data[node_path]
#			get_node(node_path).load_state(node_data)
