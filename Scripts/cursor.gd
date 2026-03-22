extends Node

func _ready() -> void:
	Input.set_custom_mouse_cursor(
	preload("res://Assets/Main/cursor.png"),
	Input.CURSOR_ARROW,
	Vector2(0, 0) # Hotspot
	)
