extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#memanggil fungsi untuk tetap mengupdate info save data
	$"../savenloader".checksavedataforDelete()
	
	
	# mengecek dan memberikan info tentang data, apakah ada atau tidak
	var statusdata = ""
	if Global.saveDataAvailable:
		statusdata = ""
	else:
		statusdata = ",namun data tidak ada atau baru saja dihapus"
	
	
	# mengecek status pilihan ganda, untuk konfirmasi sebelum menghapus data
	var selectedfordelete = $"../../setting/OptionButton2".selected
	
	if selectedfordelete == -1 :
		$"../../setting/Label4".text = "*sebagai konfirmasi, jawab pertanyaan dulu jika
anda benar benar yakin untuk menghapus
semua data riwayat anda."
	elif selectedfordelete == 0:
		$"../../setting/Label4".text = "*pilihan salah "+statusdata
	elif selectedfordelete == 1:
		$"../../setting/Label4".text = "*pilihan benar "+statusdata
	elif selectedfordelete == 2:
		$"../../setting/Label4".text = "*pilihan anda salah"+statusdata
	
	
	# mengupdate apakah kondisi data tersedia dan pilihan benar untuk bisa menghapus data
	if Global.saveDataAvailable and selectedfordelete == 1:
		$"../../setting/hapusdata".disabled = false
	else:
		$"../../setting/hapusdata".disabled = true
	
	
	pass


func _on_opt_button_pressed() -> void:
	$"../../option".show()
	pass # Replace with function body.


func _on_button_4_pressed() -> void:
	$"../../option".hide()
	pass # Replace with function body.


func _on_button_pressed() -> void:
	# mengambil data dari array untuk di masukkan ke itemlist
	for item in $"../..".item_array :
		$"../../riwayatfull/ItemList".add_item(item)
	print("array telah dimuat")
	
	$"../../riwayatfull".show()
	$"../../option".hide()
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	$"../../setting".show()
	$"../../option".hide()
	pass # Replace with function body.


func _on_button_3_pressed() -> void:
	$"../savenloader".loadcatatan()
	print("catatan telah dimuat")
	$"../../catatan".show()
	$"../../option".hide()
	pass # Replace with function body.
	

func _on_catbutton_pressed() -> void:
	$"../../option".show()
	$"../savenloader".savecatatan()
	print("catatan telah disimpan")
	$"../../catatan".hide()
	pass # Replace with function body.


func _on_riwbutton_pressed() -> void:
	$"../../option".show()
	$"../../riwayatfull/ItemList".clear()
	$"../../riwayatfull".hide()
	pass # Replace with function body.


func _on_settbutton_pressed() -> void:
	$"../../option".show()
	$"../../setting".hide()
	pass # Replace with function body.


func _on_savesetting_pressed() -> void:
	$"../../setting/OptionButton".usestyle()
	$"../savenloader".savestyle()
	print("style telah disimpan")
	
	
	
	pass # Replace with function body.
