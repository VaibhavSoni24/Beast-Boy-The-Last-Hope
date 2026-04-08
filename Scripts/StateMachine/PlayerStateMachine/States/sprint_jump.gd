extends Motion

func _enter() -> void:
	jump()

func _update(delta: float) -> void:
	calculate_gravity(delta)
	calculate_velocity(SPRINT_SPEED, direction, delta)
	
	sprint_remaining -= delta
	
	if velocity.y <= 0:
		finished.emit("SprintFall")

func jump() -> void:
	velocity.y = JUMP_VELOCITY
