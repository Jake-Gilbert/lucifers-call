#Created by Jake Gilbert
extends "res://addons/gut/test.gd"

var Player = preload("res://Player/Scripts/Player.gd")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#Testing firing
func test_is_firing():
	var player = Player.new()		
	player.shootHelp()
	assert_eq(player.currentAmmo, 9, "Shooting gun once")
#Testing reloading
func test_is_reloading():
	var player = Player.new()
	for i in range (20):
		player.shootHelp()	
	player.reloadHelp()
	assert_eq(player.currentAmmo, 10, "Reloading gun")
#Testing moving
func test_is_moving():
	var player = Player.new()
	player.moveHelper()
	assert_ne(player.movedir.x, 0)	
	assert_ne(player.movedir.y, 0)
	
	
