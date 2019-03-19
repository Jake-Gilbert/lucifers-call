extends "res://addons/gut/test.gd"
var Enemy1 = preload("res://Assets/Enemies/Scripts/Enemy1.gd")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func test_enemy_damaged():
   var enemy = Enemy1.new()
   enemy.lose_health()
   assert_eq(enemy.health, 3)

func test_enemy_dead():
   var enemy = Enemy1.new()
   enemy.lose_health()
   enemy.lose_health()
   enemy.lose_health()
   enemy.lose_health()
   assert_eq(enemy.health, 0)
