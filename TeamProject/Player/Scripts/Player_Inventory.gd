extends Node

onready var itemList = get_node("Panel/ItemList")

onready var itemMenu = get_node("Panel/WindowDialog_ItemMenu")
onready var itemMenu_TextureFrame_Icon = get_node("Panel/WindowDialog_ItemMenu/ItemMenu_TextureFrame_Icon")
onready var itemMenu_RichTextLabel_ItemInfo = get_node("Panel/WindowDialog_ItemMenu/ItemMenu_RichTextLabel_ItemInfo")

var activeItemSlot = -1
var dropItemSlot = -1

onready var isDraggingItem = false
var draggedItemTexture
onready var draggedItem = get_node("Panel/Sprite_DraggedItem")
onready var mouseButtonReleased = true
var draggedItemSlot = -1
onready var initial_mousePos = Vector2()
onready var cursor_insideItemList = false

func _ready():
	# Initialize Item List
	itemList.set_max_columns(9)
	itemList.set_fixed_icon_size(Vector2(50,50))
	itemList.set_icon_mode(ItemList.ICON_MODE_TOP)
	itemList.set_select_mode(ItemList.SELECT_SINGLE)
	itemList.set_same_column_width(true)
	itemList.set_allow_rmb_select(true)

	load_items()

	set_process(false)
	set_process_input(true)

func _process(delta):
	if (isDraggingItem):
		draggedItem.global_position = get_viewport().get_mouse_position()

func _input(event):
	if (event is InputEventMouseButton):
		if (event.is_action_pressed("mouse_leftbtn")):
			mouseButtonReleased = false
			initial_mousePos = get_viewport().get_mouse_position()
		if (event.is_action_released("mouse_leftbtn")):
			move_item()
			end_drag_item()

	if (event is InputEventMouseMotion):
		if (cursor_insideItemList):
			activeItemSlot = itemList.get_item_at_position(itemList.get_local_mouse_position(),true)
			if (activeItemSlot >= 0):
				itemList.select(activeItemSlot, true)
				if (isDraggingItem or mouseButtonReleased):
					return
				if (!itemList.is_item_selectable(activeItemSlot)):
					end_drag_item()
				if (initial_mousePos.distance_to(get_viewport().get_mouse_position()) > 0.0):
					begin_drag_item(activeItemSlot)
		else:
			activeItemSlot = -1


func load_items():
	itemList.clear()
	for slot in range(0, Global_Player.inventory_maxSlots):
		itemList.add_item("", null, false)
		update_slot(slot)


func update_slot(slot):
	var inventoryItem = Global_Player.inventory[String(slot)]
	var itemMetaData = Global_ItemDatabase.get_item(inventoryItem["id"])
	var icon = ResourceLoader.load(itemMetaData["icon"])
	var amount = int(inventoryItem["amount"])

	itemMetaData["amount"] = amount
	if (!itemMetaData["stackable"]):
		amount = " "
	itemList.set_item_text(slot, String(amount))
	itemList.set_item_icon(slot, icon)
	itemList.set_item_selectable(slot, int(inventoryItem["id"]) > 0)
	itemList.set_item_metadata(slot, itemMetaData)
	itemList.set_item_tooltip(slot, itemMetaData["name"])
	itemList.set_item_tooltip_enabled(slot, int(inventoryItem["id"]) > 0)


func _on_ItemList_item_rmb_selected(index, atpos):
	if (isDraggingItem):
		return

	dropItemSlot = index

	var itemData = itemList.get_item_metadata(index)
	if (int(itemData["id"])) < 1: return
	var strItemInfo = ""
	
	itemMenu.set_position(get_viewport().get_mouse_position())
	itemMenu.set_title(itemData["name"])
	itemMenu_TextureFrame_Icon.set_texture(itemList.get_item_icon(index))
	
	strItemInfo = "Name: [color=#00aedb] " + itemData["name"] + "[/color]\n"
	strItemInfo = strItemInfo + "Type: [color=#f37735] " + itemData["type"] + "[/color]\n"
	strItemInfo = strItemInfo + "\n[color=#b3cde0]" + itemData["description"] + "[/color]"
	
	itemMenu_RichTextLabel_ItemInfo.set_bbcode(strItemInfo)
	activeItemSlot = index
	itemMenu.popup()

func begin_drag_item(index):
	if (isDraggingItem):
		return
	if (index < 0):
		return

	set_process(true)
	draggedItem.texture = itemList.get_item_icon(index)
	draggedItem.show()

	itemList.set_item_text(index, " ")
	itemList.set_item_icon(index, ResourceLoader.load(Global_ItemDatabase.get_item(0)["icon"]))

	draggedItemSlot = index
	isDraggingItem = true
	mouseButtonReleased = false
	draggedItem.global_translate(get_viewport().get_mouse_position())


func end_drag_item():
	set_process(false)
	draggedItemSlot = -1
	draggedItem.hide()
	mouseButtonReleased = true
	isDraggingItem = false
	activeItemSlot = -1
	return


func move_item():
	if (draggedItemSlot < 0):
		return
	if (activeItemSlot == draggedItemSlot or activeItemSlot < 0):
		update_slot(draggedItemSlot)
		return
	Global_Player.inventory_moveItem(draggedItemSlot, activeItemSlot)
	update_slot(draggedItemSlot)
	update_slot(activeItemSlot)


func _on_ItemList_mouse_entered():
	cursor_insideItemList = true;


func _on_ItemList_mouse_exited():
	cursor_insideItemList = false;


func _on_Close_Button_pressed():
	get_tree().change_scene("res://Levels/Scenes/LevelOneWithDoor.tscn")