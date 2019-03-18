#Loads the item into the inventory depending on the item ID
#Created by Hannah
extends Node

var url_database_item = "res://Database//Database_Items.json"

func get_item(id):
	var itemData = {}
	itemData = Global_DataParser.load_data(url_database_item)
	
	if !itemData.has(String(id)):
		print("Item does not exist.")
		return
	
	itemData[String(id)]["id"] = int(id)
	return itemData[String(id)]
	