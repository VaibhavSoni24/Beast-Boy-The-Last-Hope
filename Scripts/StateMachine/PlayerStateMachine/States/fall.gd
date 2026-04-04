extends Motion

func _enter() -> void:
	pass

func _update(_delta: float) -> void:
	set_direction()
	calculate_gravity(_delta)
	calculate_velocity(SPEED, direction, _delta)
	
	if is_on_floor():
		finished.emit("Idle")
