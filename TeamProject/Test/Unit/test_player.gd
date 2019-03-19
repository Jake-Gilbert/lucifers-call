#Created by Jake Gilbert
extends "res://addons/gut/test.gd"

var Player = preload("res://Player/Scripts/Player.gd")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass


func test_is_firing():
	var player = Player.new()		
	player.shoot()
	print(player.currentAmmo)
	assert_ne(10, player.currentAmmo)