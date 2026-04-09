extends Motion

signal aim_entered
signal aim_exited

func _enter() -> void:
	aim_entered.emit()
	return super._enter()

func _state_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		aim_exited.emit()
		finished.emit("Jump")
	
	if event.is_action_pressed("sprint") and sprint_remaining > PLAYER_MOVEMENT_STATS.minimum_sprint_threshold:
		aim_exited.emit()
		finished.emit("Sprint")
	
	if event.is_action_released("aim"):
		aim_exited.emit()
		finished.emit("Run")

func _update(delta: float) -> void:
	set_direction()
	calculate_velocity(aim_speed, direction, PLAYER_MOVEMENT_STATS.acceleration, delta)
	replenish_sprint(delta)
	direction_updated.emit(input_dir)
	
	if direction == Vector3.ZERO:
		finished.emit("AimIdle")
	
	if not is_on_floor():
		aim_exited.emit()
		finished.emit("Fall")
