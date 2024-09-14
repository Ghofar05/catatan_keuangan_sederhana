class_name saveloader
extends Node

@onready var totaluang: Label = %"total uang"
@onready var mains = $"../.."



func save():
	var file = FileAccess.open("user://savedata.json",FileAccess.WRITE)
	var saved_data = {}
	
	saved_data["totaluang"] = mains.inputUang
	saved_data["keteranganItems"] = mains.keterangan
	saved_data["daftarItems"] = mains.item_array
	
	var json = JSON.stringify(saved_data)
	file.store_string(json)
	file.close()
	
func loads():
	var file = FileAccess.open("user://savedata.json",FileAccess.READ)
	var json = file.get_as_text()
	
	var save_data = JSON.parse_string(json)
	
	mains.inputUang = save_data["totaluang"]
	mains.keterangan = save_data["keteranganItems"]
	mains.item_array = save_data["daftarItems"]
	
	for item in mains.item_array :
		%ItemList.add_item(item)
	
	
	
	file.close()
	
	
func checksavedata():
	var file = FileAccess.file_exists("user://savedata.json")
	if file == true:
		Global.saveDataAvailable = true
		loads()
		print("data loaded")
	else:
		Global.saveDataAvailable = false
		print("no data")
	pass

func checksavedataforDelete():
	#mengecek dan mengupdate status save data ke global
	var file = FileAccess.file_exists("user://savedata.json")
	if file == true:
		Global.saveDataAvailable = true
	else:
		Global.saveDataAvailable = false



func _on_hapusdata_pressed() -> void:
	#menghapus data
	if Global.saveDataAvailable:
		mains.item_array.clear()
		mains.keterangan.clear()
		mains.inputUang = 0
		mains.total_uang.text = "0"
		$"../../riwayatfull/ItemList".clear()
		%ItemList.clear()
		DirAccess.remove_absolute("user://savedata.json")
		
	else:
		print("no data")
	
