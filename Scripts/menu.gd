extends Node2D

@onready var start_button = $MainMenu/Menu/StartGame
@onready var game_button = $OptionsMenu/Menu/Game
@onready var language_button = $Game/LanguageButton
@onready var credits_button = $Game/CreditsButton

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

@onready var master = $Audio/MasterSlider
@onready var music = $Audio/MusicSlider
@onready var ui = $Audio/UISlider
@onready var enemy = $Audio/EnemySlider
@onready var gun = $Audio/GunSlider
@onready var sound = $Audio/SoundSlider

@onready var notice = $Game/Notice
@onready var timer = $Game/Timer

@onready var music_player = $Music

func _ready():
	show_main()
	start_button.grab_focus()
	music_player.play()

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
	game_button.grab_focus()
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
	language_button.grab_focus()
	hide_main_menu()
	game.show()
	audio.hide()
	video.hide()
	controller.hide()
	keyboard.hide()
	notice.hide()

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

func _on_language_button_button_down() -> void:
	notice.show()
	timer.start()

func _on_timer_timeout() -> void:
	notice.hide()

func _on_credits_button_button_down() -> void:
	pass # Replace with changing the global variable to true or false for credits showing.

func _on_achievements_button_button_down() -> void:
	notice.show()
	timer.start()

func _on_reset_game_button_down() -> void:
	credits_button.button_pressed = true

func _on_back_game_button_down() -> void:
	game.hide()
	options.show()

func _on_reset_audio_button_down() -> void:
	master.value = 1
	music.value = 1
	ui.value = 1
	enemy.value = 1
	gun.value = 1
	sound.value = 1

func _on_back_audio_button_down() -> void:
	audio.hide()
	options.show()
