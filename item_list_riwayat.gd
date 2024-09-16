extends ItemList
#

# next update feature


#var target_scroll_y = 0.0
#var scroll_speed = 10.0  
#var smoothing_factor = 0.1 
#
#
#
#func _ready():
	#target_scroll_y = self.get_v_scroll_bar()
	#
#
#
#
#func _input(event):
	#if event is InputEventScreenDrag:
		#target_scroll_y += - (event.relative.y / scroll_speed)
		#
#func _process(_delta):
#
	#self.scroll_vertical = lerp(self.get_v_scroll_bar().scroll_vertical, target_scroll_y, smoothing_factor)
	#
#func _physics_process(delta: float) -> void:
	#if Input.is_action_just_pressed("ui_accept"):
		#for i in 1000:
			#self.add_item(str(i))
