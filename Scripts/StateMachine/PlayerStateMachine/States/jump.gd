extends Motion

func _enter() -> void:
	jump()

func _update(_delta: float) -> void:
	set_direction()
	calculate_gravity(_delta)
	calculate_velocity(SPEED, direction, _delta)
	
	if velocity.y <= 0:
		finished.emit("Fall")

func jump() -> void:
	velocity.y = JUMP_VELOCITY
