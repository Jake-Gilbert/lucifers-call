extends Node2D

var playerInside

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	self.hide()
	pass

func _on_RoomAreaA_body_entered(body):
	if body.name == "Player":
		self.show()
		#get_tree().change_scene("res://Cutscenes/Scenes/MazeCutsceneOne.tscn")
		playerInside = true


func _on_RoomAreaA_body_exited(body):
	if body.name == "Player":
		self.hide()
		playerInside = false
