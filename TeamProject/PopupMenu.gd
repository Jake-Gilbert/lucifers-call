#PopupMenu.gd
#
#

extends PopupMenu

onready var player = get_node("../../Player")
onready var doorA = get_node("../../L1Hallway/DoorL1A")
onready var doorB = get_node("../../L1Hallway/DoorL1B")
onready var doorC = get_node("../../L1Hallway/DoorL1C")
onready var doorD = get_node("../../L1Hallway/DoorL1D")

func _ready():
	pass

func _on_NoBtn_pressed():
	player.set_physics_process(true)
	self.hide()


func _on_YesBtn_pressed():
	player.set_physics_process(true)
	if get_node("../../L1Hallway").roomA == true:
		if L1Map.mazePuzzle == true:
			#L1Map.puzzle1 = true
			doorA.get_node("CollisionShape2D").disabled = true
			Global_SceneSwitch.save_current_scene()
		#L1Map._deferred_goto_scene("res://Puzzles/Scenes/(USE THIS)Puzzle.tscn")
		#L1Map.playerPosition = position
			L1Map.goto_scene("res://Cutscenes/Scenes/MazeCutsceneOne.tscn")
		else: 
			pass

	if get_node("../../L1Hallway").roomB == true:
		if L1Map.potatoCombat == true:
			doorB.queue_free()
			Global_SceneSwitch.save_current_scene()
			doorB.get_node("CollisionShape2D").disabled = true
		#L1Map._deferred_goto_scene("res://Puzzles/Scenes/(USE THIS)Puzzle.tscn")
		#L1Map.playerPosition = position
			L1Map.goto_scene("res://Cutscenes/Scenes/PotatoCombatCutsceneOne.tscn")
		else:
			pass

	if get_node("../../L1Hallway").roomC == true:
		if L1Map.flipPuzzle == true:
			#L1Map.puzzle1 = true
			doorC.get_node("CollisionShape2D").disabled = true
			Global_SceneSwitch.save_current_scene()
		#L1Map._deferred_goto_scene("res://Puzzles/Scenes/(USE THIS)Puzzle.tscn")
		#L1Map.playerPosition = position
			L1Map.goto_scene("res://Cutscenes/Scenes/CatalystCutsceneOne.tscn")
		else: 
			pass

	if get_node("../../L1Hallway").roomD == true:
		if L1Map.ghostCombat == true:
			doorD.queue_free()
			Global_SceneSwitch.save_current_scene()
			doorD.get_node("CollisionShape2D").disabled = true
		#L1Map._deferred_goto_scene("res://Puzzles/Scenes/(USE THIS)Puzzle.tscn")
		#L1Map.playerPosition = position
			L1Map.goto_scene("res://Cutscenes/Scenes/GhostCombatCutsceneOne.tscn")
		else:
			pass
	self.hide()