extends Node2D





# akses node
@onready var inputfield = $ui3/LineEdit #input untuk memasukkan jumlah uang
@onready var item_list: ItemList = %ItemList
@onready var total_uang : Label = $"ui/total uang"
@onready var catatan



@onready var dompet := 0
@onready var date = ""
@onready var time = ""
@onready var kategori = ""
@onready var combine = ""





#status
@onready var gacukup = false # status mengenai apakah total uang cukup untuk transaksi
@onready var isnumber = false # status mengenai apakah bentuk input pada inputfield bentuknya angka atau bukan



#array
@onready var item_array = [] #menyimpan setiap data pada item list
@onready var keterangan = [] #menyimpan setiap keterangan pada setiap input



func _ready() -> void:
	$ui/version.text = Global.appVersion
	
	
	
	$utilitas/savenloader.checksavedata() #mengecek dan meload data json
	total_uang.text = add_comma_to_int(dompet)
	
	
	$utilitas/savenloader.checkdatastyle()
	$setting/OptionButton.usestyle()
	



func _process(_delta) -> void:
	date = Time.get_date_string_from_system()
	time = Time.get_time_string_from_system()
	
	
	if $ui3/OptionButton.selected == -1:
		$ui3/save.disabled = true
	elif int(inputfield.text) <= 0:
		$ui3/save.disabled = true
	elif isnumber == false:
		$ui3/save.disabled = true
	else:
		$ui3/info.hide()
		$ui3/save.disabled = false
	
	if gacukup == true and kategori == "keluar":
		$ui3/info2.text = "*uang ga cukup"
		$ui3/save.disabled = true
	else:
		$ui3/info2.text = ""
		pass
		
	if Input.is_action_just_pressed("back"):
		$ui3.hide()
		$riwayatfull.hide()
		$setting.hide()
		$catatan.hide()
		$ktrangan.hide()
		$option.hide()
	#if isnumber == true:
		#$ui3/info2.text = "*masukkan angka"
	#else:
		#$ui3/info2.text = "*masukkan angka"
	
	gacukup = budgetcek()
	kategori = kategoricek()
	isnumber = cekinput()
	


# menambahkan koma untuk number
func add_comma_to_int(value: int) -> String:
	# Convert value to string.
	var str_value: String = str(value)
	
	# Check if the value is positive or negative.
	# Use index 0(excluded) if positive to avoid comma before the 1st digit.
	# Use index 1(excluded) if negative to avoid comma after the - sign.
	var loop_end: int = 0 if value > -1 else 1
	
	# Loop backward starting at the last 3 digits,
	# add comma then, repeat every 3rd step.
	for i in range(str_value.length()-3, loop_end, -3):
		str_value = str_value.insert(i, ",")
	
	# Return the formatted string.
	return str_value

# mengecek apakah uang cukup untuk diambil dari total uang yang ada, jika tidak cukup maka -
# - transaksi tidak bisa dilanjutkan
func budgetcek():
	var value = dompet - Global.virtualkeyboardvalue
	var uangkosong = false
	if value <= 0:
		uangkosong = true
	else:
		uangkosong = false
	return uangkosong


# memastikan user untuk mengisi kategori untuk bisa melanjutkan
func kategoricek():
	var kat = ""
	if $ui3/OptionButton.selected == 0:
		kat = "masuk"
	elif $ui3/OptionButton.selected == 1:
		kat = "keluar"
	return kat
	
	
# mengecek input untuk memaskitan inpunya dalam bentuk number bukan string
func cekinput():
	var input = Global.virtualkeyboardvalue
	var cek = int(input)
	var status = false
	if cek == 0 :
		status = false
	elif cek >= 1 :
		status = true
	return status


# memasukkan data dari array ke item list
func checkitemlist():
	
	item_array.clear()
	
	for i in range(item_list.get_item_count()):
		item_array.append(item_list.get_item_text(i))
	
	
	print(item_array)
	pass



# tombol plus
func _on_button_pressed() -> void:
	print("di tekan")

	$ui3.show()
	$AnimationPlayer.play("open")
	$ktrangan.hide()
	
	


func _on_cancel_pressed() -> void:
	
	
	inputfield.text = ""
	$ui3/OptionButton.selected = -1
	$AnimationPlayer.play("close")
	await get_tree().create_timer(0.5).timeout
	$Control.wadah.clear()
	$ui3.hide()
	

#ketika save button di tekan
func _on_save_pressed() -> void:
	
	
	if kategori == "masuk":
		dompet += Global.virtualkeyboardvalue
	else:
		dompet -= Global.virtualkeyboardvalue
	
	
	total_uang.text = add_comma_to_int(dompet)
	
	#mengkombinasikan keterangan transaksi dalam satu string
	combine = "tgl "+date+", jam "+time+" "+kategori+" "+"Rp. "+add_comma_to_int(int(Global.virtualkeyboardvalue))
	
	#memasukkan value combine yang barusan kita buat ke dalam item list
	$ui2/ItemList.add_item(combine,null,true)
	
	#memasukkan keterangan ke dalam array
	keterangan.append($ui3/TextEdit.text)
	
	#menyimpan itemlist ke dalam array
	checkitemlist()
	
	#menyimpan data ke file eksteranal json
	$utilitas/savenloader.save()
	
	
	# membersihkan value input an terakhir
	$ui3/TextEdit.text = ""
	$Control.wadah.clear()
	$ui3/OptionButton.selected = -1
	
	
	$AnimationPlayer.play("close")

# mengakses array keterangan setiap transaksi pada item list
func _on_item_list_item_clicked(index: int, at_position: Vector2, mouse_button_index: int) -> void:
	#print($ui2/ItemList.get_item_text(index))
	$ktrangan/TextEdit.text = keterangan[index]
	$ktrangan.show()
	$AnimationPlayer.play("keterangan pop up")
	$ui2/ItemList.deselect(index)


func _on_closebut_pressed() -> void:
	$ktrangan.hide()



func _on_ovk_pressed() -> void:
	$Control.show()
	pass # Replace with function body.
