extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var current_scene = null
var puzzle1 = false
var playerPosition = Vector2(0,0)
var initialise = false
var mazePuzzle = false
var flipPuzzle = false
var ghostCombat = false
var potatoCombat = false
var L1boss = false

func _ready():
	set_process(true)

func _process(delta):
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)

func goto_scene(path):
    # This function will usually be called from a signal callback,
    # or some other function in the current scene.
    # Deleting the current scene at this point is
    # a bad idea, because it may still be executing code.
    # This will result in a crash or unexpected behavior.

    # The solution is to defer the load to a later time, when
    # we can be sure that no code from the current scene is running:

    call_deferred("_deferred_goto_scene", path)


func _deferred_goto_scene(path):
	    # It is now safe to remove the current scene
	current_scene.free()
	 # Load the new scene.
	var s = ResourceLoader.load(path)
	  # Instance the new scene.
	current_scene = s.instance()
	
	  # Add it to the active scene, as child of root.
	get_tree().get_root().add_child(current_scene)
	# Optionally, to make it compatible with the SceneTree.change_scene() API.
	get_tree().set_current_scene(current_scene)



