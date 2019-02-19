#this script not in right place
extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	$UsableHUD/HUD/HBoxContainer2/items.frame = get_node("Player").items