#Puzzle1.gd
#Created by Faly Richou and Zainab Parvin

extends Navigation2D

#Gets the path that the sprite will follow in form of variable
onready var pathOne = get_node("Paths/Path1/PathFollow2D")
onready var pathTwo = get_node("Paths/Path2/PathFollow2D")
onready var pathThree = get_node("Paths/Path3/PathFollow2D")
onready var pathFour = get_node("Paths/Path4/PathFollow2D")
onready var pathFive = get_node("Paths/Path5/PathFollow2D")

#The sprite's speed
var speed = 0.001
var boploc = 0
var cleared = 0

func _ready():
	set_process(true)

func clear():
	cleared += 1

func _process(delta):
	boploc += speed
	pathOne.set_unit_offset(boploc)
	pathTwo.set_unit_offset(boploc)
	pathThree.set_unit_offset(boploc)
	pathFour.set_unit_offset(boploc)
	pathFive.set_unit_offset(boploc)
	if cleared == 5:
		Global_SceneSwitch.reload_last_saved()