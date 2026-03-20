extends "res://Scripts/button.gd"

@export var game_scene: String = "res://scenes/game.tscn"

func _pressed():
	get_tree().change_scene_to_file(game_scene)
