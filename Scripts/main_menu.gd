extends Node2D

@onready var start_button = $Menu/StartGame

@onready var music = $Music

func _ready():
	start_button.grab_focus()
	music.play()
