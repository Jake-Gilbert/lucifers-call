#InventorySection.gd
#
#

extends GridContainer

const ItemClass = preload("res://UI/Script/Item.gd")
const ItemSlotClass = preload("res://UI/Script/ItemSlot.gd")

const itemImages = [
	preload("res://Assets/Images/Assets_Gun.png"),
];

const itemDictionary = {
	0: {
		"itemIcon": itemImages[0]
	},
}

var slotList = Array()
var itemList = Array()

var holdingItem = null

func _ready():
	for item in itemDictionary:
		var itemIcon = itemDictionary[item].itemIcon
		itemList.append(ItemClass.new(itemIcon))
	
	for i in range(18):
		var slot = ItemSlotClass.new(i)
		slotList.append(slot)
		add_child(slot)
	
	slotList[0].setItem(itemList[0])
	
	pass

func _input(event):
	if holdingItem != null && holdingItem.picked:
		holdingItem.rect_global_position = Vector2(event.position.x, event.position.y)
		#holdingItem.rect_position = Vector2(event.position.x, event.position.y)
		#holdingItem.rect_position = Vector2(0, 0)

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		var clickedSlot
		for slot in slotList:
			var slotMousePos = slot.get_local_mouse_position()
			var slotTexture = slot.texture
			var isClicked = slotMousePos.x >= 0 && slotMousePos.x <= slotTexture.get_width() && slotMousePos.y >= 0 && slotMousePos.y <= slotTexture.get_height()
			if isClicked:
				clickedSlot = slot
		
		if holdingItem != null:
			if clickedSlot.item != null:
				var tempItem = clickedSlot.item
				var oldSlot = slotList[slotList.find(holdingItem.itemSlot)]
				clickedSlot.pickItem()
				clickedSlot.putItem(holdingItem)
				holdingItem = null
				oldSlot.putItem(tempItem)
			else:
				clickedSlot.putItem(holdingItem)
				holdingItem = null
		elif clickedSlot.item != null:
			holdingItem = clickedSlot.item
			clickedSlot.pickItem()
			#holdingItem.rect_global_position = Vector2(event.position.x, event.position.y)
			holdingItem.rect_position = Vector2(event.position.x, event.position.y)
	pass