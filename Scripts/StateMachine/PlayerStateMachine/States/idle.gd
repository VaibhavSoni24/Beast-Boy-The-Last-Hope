extends Motion

func _enter() -> void:
	pass

func _update(_delta: float) -> void:
	set_direction()
	calculate_velocity(SPEED, direction, _delta)
	
	if direction != Vector3.ZERO:
		finished.emit("Run")
	
	if not is_on_floor():
		finished.emit("Fall")
