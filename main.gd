extends Node2D



@onready var total_uang: Label = $"ui/total uang"
@onready var inputUang := 0

@onready var date = ""
@onready var time = ""
@onready var kategori = ""
@onready var combine = ""
@onready var gacukup = false

@onready var keterangan = []

@onready var inputfield = $ui3/LineEdit
@onready var isnumber = false

@onready var item_list: ItemList = %ItemList
@onready var item_array = []



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	$utilitas/savenloader.checksavedata()
	pass # Replace with function body
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	
	date = Time.get_date_string_from_system()
	time = Time.get_time_string_from_system()
	
	
	if $ui3/OptionButton.selected == -1:
		$ui3/save.disabled = true
	elif int(inputfield.text) <= 0:
		$ui3/save.disabled = true
	elif gacukup == true and kategori == "keluar":
		$ui3/save.disabled = true
	elif isnumber == false:
		$ui3/save.disabled = true
	else:
		$ui3/info.hide()
		$ui3/save.disabled = false
		
	if isnumber == true:
		$ui3/info2.hide()
	else:
		$ui3/info2.show()
	
	gacukup = budgetcek()
	kategori = kategoricek()
	isnumber = cekinput()
	
	
	# print(inputUang)
	
	# buka chrome
	


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


func budgetcek():
	var value = inputUang - int(inputfield.text)
	var uangkosong = false
	if value <= 0:
		uangkosong = true
	else:
		uangkosong = false
	return uangkosong



func kategoricek():
	var kat = ""
	if $ui3/OptionButton.selected == 0:
		kat = "masuk"
	elif $ui3/OptionButton.selected == 1:
		kat = "keluar"
	return kat
	
	
	
func cekinput():
	var input = inputfield.text
	var cek = int(input)
	var status = false
	if cek == 0 :
		status = false
	elif cek >= 1 :
		status = true
	return status



func checkitemlist():
	
	for i in range(item_list.get_item_count()):
		item_array.append(item_list.get_item_text(i))
	
	print(item_array)
	pass




func _on_button_pressed() -> void:
	print("di tekan")
	#$ui3.show()
	$AnimationPlayer.play("open")
	


func _on_cancel_pressed() -> void:
	
	
	inputfield.text = ""
	$ui3/OptionButton.selected = -1
	
	
	$AnimationPlayer.play("close")
	#$ui3.hide()
	pass # Replace with function body.


func _on_save_pressed() -> void:
	
	
	if kategori == "masuk":
		inputUang += int(inputfield.text)
	else:
		inputUang -= int(inputfield.text)
	
	
	total_uang.text = add_comma_to_int(inputUang)
	
	

	combine = "tgl "+date+", jam "+time+" "+kategori+" "+"Rp. "+add_comma_to_int(int(inputfield.text))
	
	$ui2/ItemList.add_item(combine,null,true)
	
	keterangan.append($ui3/TextEdit.text)
	
	
	checkitemlist()
	
	#menyimpan data
	$utilitas/savenloader.save()
	
	
	
	$ui3/TextEdit.text = ""
	inputfield.text = ""
	$ui3/OptionButton.selected = -1
	
	#play the animation
	$AnimationPlayer.play("close")
	#$ui3.hide()
	pass # Replace with function body.


func _on_item_list_item_clicked(index: int, at_position: Vector2, mouse_button_index: int) -> void:
	print($ui2/ItemList.get_item_text(index))
	$ktrangan/TextEdit.text = keterangan[index]
	$ktrangan.show()
	$ui2/ItemList.deselect(index)
	pass # Replace with function body.


func _on_closebut_pressed() -> void:
	$ktrangan.hide()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	if isnumber == false:
		inputfield.clear()

	pass # Replace with function body.
