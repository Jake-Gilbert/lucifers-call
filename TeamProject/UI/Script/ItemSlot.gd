#ItemSlot.gd
#
#

extends TextureRect

var slotIndex;
var item = null;

func _init(slotIndex):
	name = "ItemSlot_%d" % slotIndex
	texture = preload("res://UI/Images/inventorySlot-1.png")
	mouse_filter = Control.MOUSE_FILTER_PASS
#	mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	pass

func setItem(newItem):
	add_child(newItem)
	item = newItem
	print("I have set the item")
	pass

func pickItem():
	item.pickItem()
	remove_child(item)
	get_parent().get_parent().add_child(item)
	item = null
	print("I have picked the item")

func putItem(newItem):
	item = newItem
	item.putItem()
	get_parent().get_parent().remove_child(item)
	add_child(item)
	print("I have put the item")
	pass

	#The control will receive mouse button input events through _gui_input if clicked on. 
	#If this control does not handle the event, the parent control (if any) will be considered 
	#for a mouse click, and so on until there is no more parent control to potentially handle it. 
	#Even if no control handled it at all, the event will still be handled automatically.
	#The control will receive mouse button input events through _gui_input if clicked on. 
	#If this control does not handle the event, the parent control (if any) will be considered 
	#for a mouse click, and so on until there is no more parent control to potentially handle it. 
	#Even if no control handled it at all, the event will still be handled automatically.
#	mouse_filter = Control.MOUSE_FILTER_PASS