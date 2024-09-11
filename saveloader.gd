class_name saveloader
extends Node

@onready var totaluang: Label = %"total uang"
@onready var mains = $"../.."



func save():
	var file = FileAccess.open("user://savedata.json",FileAccess.WRITE)
	var saved_data = {}
	
	saved_data["totaluang"] = int(totaluang.text)
	saved_data["keteranganItems"] = mains.keterangan
	saved_data["daftarItems"] = mains.item_array
	
	var json = JSON.stringify(saved_data)
	file.store_string(json)
	file.close()
	
func loads():
	var file = FileAccess.open("user://savedata.json",FileAccess.READ)
	var json = file.get_as_text()
	
	var save_data = JSON.parse_string(json)
	
	totaluang.text = str(save_data["totaluang"])
	mains.keterangan = save_data["keteranganItems"]
	mains.item_array = save_data["daftarItems"]
	
	for item in mains.item_array :
		%ItemList.add_item(item)
	
	file.close()
	
	
func checksavedata():
	var file = FileAccess.file_exists("user://savedata.json")
	if file == true:
		loads()
	else:
		pass
	pass
