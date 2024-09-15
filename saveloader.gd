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
		print("data riwayat dimuat")
	else:
		Global.saveDataAvailable = false
		print("tidak ada file data riwayat")
	pass

func checksavedataforDelete():
	#mengecek dan mengupdate status save data ke global
	var file = FileAccess.file_exists("user://savedata.json")
	if file == true:
		Global.saveDataAvailable = true
	else:
		Global.saveDataAvailable = false



func savecatatan():
	var file = FileAccess.open("user://datacatatan.json",FileAccess.WRITE)
	var saved_data = {}
	
	saved_data["catatan"] = $"../../catatan/TextEdit".text
	
	var json = JSON.stringify(saved_data)
	file.store_string(json)
	file.close()


func loadcatatan():
	var data = FileAccess.file_exists("user://datacatatan.json")
	if data:
		var file = FileAccess.open("user://datacatatan.json",FileAccess.READ)
		var json = file.get_as_text()
		
		var save_data = JSON.parse_string(json)
		$"../../catatan/TextEdit".text = save_data["catatan"]
		file.close()
	else:
		print("tidak ada data catatan")
		pass
	
	





func savestyle():
	var file = FileAccess.open("user://datastyle.json",FileAccess.WRITE)
	var saved_data = {}
	
	saved_data["catatan"] = Global.styleSelected
	
	var json = JSON.stringify(saved_data)
	file.store_string(json)
	file.close()




func loadstyle():
	var file = FileAccess.open("user://datastyle.json",FileAccess.READ)
	var json = file.get_as_text()
	
	var save_data = JSON.parse_string(json)
	
	Global.styleSelected = save_data["catatan"]
	
	
	file.close()
	
	
	
func checkdatastyle():
	var data = FileAccess.file_exists("user://datastyle.json")
	if data:
		loadstyle()
	else:
		savestyle()
		pass





func _on_hapusdata_pressed() -> void:
	#menghapus data
	if Global.saveDataAvailable:
		mains.item_array.clear()
		mains.keterangan.clear()
		mains.inputUang = 0
		mains.total_uang.text = "0"
		$"../../catatan/TextEdit".text = ""
		$"../../riwayatfull/ItemList".clear()
		%ItemList.clear()
		DirAccess.remove_absolute("user://datacatatan.json")
		DirAccess.remove_absolute("user://savedata.json")
		
		print("data telah di hapus")
		
	else:
		print("no data")
	
