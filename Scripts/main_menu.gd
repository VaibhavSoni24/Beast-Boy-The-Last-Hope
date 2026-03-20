extends Node2D

@onready var start_button = $Menu/StartGame

func _ready():
	start_button.grab_focus()
