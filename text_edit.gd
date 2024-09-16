extends TextEdit

var target_scroll_y = 0.0
var scroll_speed = 50.0  # Kontrol kecepatan
var smoothing_factor = 0.1  # Kontrol tingkat kelancaran, semakin kecil semakin smooth
@onready var this = $"."


#func _gui_input(event):
	#if event is InputEventScreenTouch and event.pressed:
		#this.grab_focus()


func _ready():
	target_scroll_y = this.scroll_vertical


func _input(event):
	if event is InputEventScreenDrag:
		target_scroll_y += - (event.relative.y / scroll_speed)
		this.scroll_vertical = lerp(this.scroll_vertical, target_scroll_y, smoothing_factor)
		# Menentukan target scroll berdasarkan gesture
		
func _process(_delta):
	# Lerp untuk membuat transisi scroll lebih smooth
	pass
