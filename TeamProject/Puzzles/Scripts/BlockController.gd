#Create by Rebekah
extends KinematicBody2D

var block_list = []

func _ready():
	set_physics_process(true)

func add_block(block):
	block_list.append(block)

func check_blocks(new_block):
	for block in block_list:
		if block != new_block and block.pressed:
			block.deselect()