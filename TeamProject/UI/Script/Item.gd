#ItemSlot.gd
#
#

extends TextureRect

var itemSlot
var picked = false

func _init(itemTexture):
	texture = itemTexture
	pass

func pickItem():
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	picked = true
	pass

func putItem():
	#rect_global_position = Vector2(169, 135)
	rect_position = Vector2(0, 0)
	mouse_filter = Control.MOUSE_FILTER_PASS
	picked = false
	pass