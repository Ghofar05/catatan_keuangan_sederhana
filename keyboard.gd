extends Control


@onready var satu: Button = $"BoxContainer/HBoxContainer/1"
@onready var dua: Button = $"BoxContainer/HBoxContainer/2"
@onready var tiga: Button = $"BoxContainer/HBoxContainer/3"

@onready var empat: Button = $"BoxContainer/HBoxContainer2/4"
@onready var lima: Button = $"BoxContainer/HBoxContainer2/5"
@onready var enam: Button = $"BoxContainer/HBoxContainer2/6"

@onready var tujuh: Button = $"BoxContainer/HBoxContainer3/7"
@onready var delapan: Button = $"BoxContainer/HBoxContainer3/8"
@onready var sembilan: Button = $"BoxContainer/HBoxContainer3/9"


@onready var nol: Button = $"BoxContainer/HBoxContainer4/0"
@onready var ok: Button = $BoxContainer/HBoxContainer4/ok
@onready var del: Button = $BoxContainer/HBoxContainer4/del


@onready var istextMax = false
@onready var maxlength = 10



@onready var wadah = []
@onready var wadahdua
@onready var wadahtiga = ""



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



func checkmaxinput():
	var value = str(wadahdua)
	var total = value.length()
	
	if total <= maxlength:
		istextMax = false
		$Label.text = ""
		
	else:
		$Label.text = "input maksimal tercapai"
		istextMax = true


func allbutoncheck():
	satu.disabled = istextMax
	dua.disabled = istextMax
	tiga.disabled = istextMax
	empat.disabled = istextMax
	lima.disabled = istextMax
	enam.disabled = istextMax
	tujuh.disabled = istextMax
	delapan.disabled = istextMax
	sembilan.disabled = istextMax
	nol.disabled = istextMax


func wadahsatukedua(arr):
	var valueone = arr
	var valuetwo = ""
	
	for item in valueone:
		valuetwo += item
	
	return valuetwo




func _process(delta: float) -> void:
	
	wadahdua = int(wadahsatukedua(wadah))
	wadahtiga = add_comma_to_int(wadahdua)
	checkmaxinput()
	allbutoncheck()
	$"../ui3/LineEdit".text = wadahtiga
	
	pass




func _on_first_pressed() -> void:
	wadah.append("1")
	pass # Replace with function body.


func _on_two_pressed() -> void:
	wadah.append("2")
	pass # Replace with function body.


func _on_three_pressed() -> void:
	wadah.append("3")
	pass # Replace with function body.


func _on_four_pressed() -> void:
	wadah.append("4")
	pass # Replace with function body.


func _on_five_pressed() -> void:
	wadah.append("5")
	pass # Replace with function body.


func _on_six_pressed() -> void:
	wadah.append("6")
	pass # Replace with function body.


func _on_seven_pressed() -> void:
	wadah.append("7")
	pass # Replace with function body.


func _on_eight_pressed() -> void:
	wadah.append("8")
	pass # Replace with function body.


func _on_nine_pressed() -> void:
	wadah.append("9")
	pass # Replace with function body.


func _on_zero_pressed() -> void:
	wadah.append("0")
	pass # Replace with function body.


func _on_ok_pressed() -> void:
	Global.virtualkeyboardvalue = wadahdua
	$".".hide()
	pass # Replace with function body.


func _on_del_pressed() -> void:
	wadah.clear()
	pass # Replace with function body.


func _on_close_pressed() -> void:
	wadah.clear()
	$".".hide()
	pass # Replace with function body.
