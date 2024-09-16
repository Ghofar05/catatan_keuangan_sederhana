extends Node2D

@onready var touchpos

func startparticletouch():
	$GPUParticles2D.position = touchpos
	$GPUParticles2D.restart()
	pass



func _input(event):
	if event is InputEventScreenTouch:
		touchpos = event.position
		if event.pressed:
			startparticletouch()
		else:
			pass


func _process(delta: float) -> void:
	pass
