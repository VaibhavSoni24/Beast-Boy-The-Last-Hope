extends Node2D

@onready var start_button = $MainMenu/Menu/StartGame

@onready var main_menu = $MainMenu
@onready var start = $StartMenu
@onready var options = $OptionsMenu
@onready var achievements = $AchievementsMenu
@onready var credits = $CreditsMenu
@onready var quit = $QuitMenu

@onready var game = $Game
@onready var audio = $Audio
@onready var video = $Video
@onready var controller = $Controller
@onready var keyboard = $Keyboard

@onready var music = $Music

func _ready():
	show_main()
	start_button.grab_focus()
	music.play()

func hide_options():
	game.hide()
	audio.hide()
	video.hide()
	controller.hide()
	keyboard.hide()

func hide_main_menu():
	main_menu.hide()
	start.hide()
	options.hide()
	achievements.hide()
	credits.hide()
	quit.hide()

func show_main():
	main_menu.show()
	start.hide()
	options.hide()
	achievements.hide()
	credits.hide()
	quit.hide()
	hide_options()

func show_start():
	main_menu.hide()
	start.show()
	options.hide()
	achievements.hide()
	credits.hide()
	quit.hide()
	hide_options()

func show_options():
	main_menu.hide()
	start.hide()
	options.show()
	achievements.hide()
	credits.hide()
	quit.hide()
	hide_options()

func show_achievements():
	main_menu.hide()
	start.hide()
	options.hide()
	achievements.show()
	credits.hide()
	quit.hide()
	hide_options()

func show_credits():
	main_menu.hide()
	start.hide()
	options.hide()
	achievements.hide()
	credits.show()
	quit.hide()
	hide_options()

func show_quit():
	main_menu.hide()
	start.hide()
	options.hide()
	achievements.hide()
	credits.hide()
	quit.show()
	hide_options()

func show_games():
	hide_main_menu()
	game.show()
	audio.hide()
	video.hide()
	controller.hide()
	keyboard.hide()

func show_audio():
	hide_main_menu()
	game.hide()
	audio.show()
	video.hide()
	controller.hide()
	keyboard.hide()

func show_video():
	hide_main_menu()
	game.hide()
	audio.hide()
	video.show()
	controller.hide()
	keyboard.hide()

func show_controller():
	hide_main_menu()
	game.hide()
	audio.hide()
	video.hide()
	controller.show()
	keyboard.hide()

func show_keyboard():
	hide_main_menu()
	game.hide()
	audio.hide()
	video.hide()
	controller.hide()
	keyboard.show()

func _on_start_game_button_down() -> void:
	show_start()

func _on_options_button_down() -> void:
	show_options()

func _on_achievements_button_down() -> void:
	show_achievements()

func _on_credits_button_down() -> void:
	show_credits()

func _on_quit_game_button_down() -> void:
	show_quit()

func _on_game_button_down() -> void:
	show_games()

func _on_audio_button_down() -> void:
	show_audio()

func _on_video_button_down() -> void:
	show_video()

func _on_controller_button_down() -> void:
	show_controller()

func _on_keyboard_button_down() -> void:
	show_keyboard()
