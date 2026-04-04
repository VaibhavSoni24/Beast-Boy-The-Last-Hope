extends Motion

func _enter() -> void:
	pass

func _state_input(_event: InputEvent) -> void:
	if _event.is_action_pressed("jump"):
		finished.emit("Jump")

func _update(_delta: float) -> void:
	set_direction()
	calculate_velocity(SPEED, direction, _delta)
	
	if direction == Vector3.ZERO:
		finished.emit("Idle")
	
	if not is_on_floor():
		finished.emit("Fall")
