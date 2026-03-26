extends TextureButton

@export var scale_normal := 1.0
@export var scale_hover := 1.08
@export var scale_speed := 10.0

@export var glow_normal := 0.4
@export var glow_hover := 1.5
@export var glow_pressed := 2.5
@export var glow_speed := 8.0

@export var glow_color := Color(1.0, 1.0, 1.0)

@onready var focus_sound = $"UI Sound/Focus"
@onready var click_sound = $"UI Sound/Click"

@export var pulse_speed := 2.0
@export var pulse_strength := 0.03

var _target_scale := 1.0
var _target_glow := 1.0
var _is_hovered := false

var time := 0.0

@onready var mat := material as ShaderMaterial

func _ready():
	pivot_offset = size / 2
	focus_mode = Control.FOCUS_ALL

	if mat:
		mat.set_shader_parameter("glow_color", glow_color)

	_set_idle()

func _process(delta):
	time += delta

	# ===== SCALE WITH PULSE =====
	var pulse := 0.0
	if _is_hovered:
		pulse = sin(time * pulse_speed) * pulse_strength

	var target: float = _target_scale + pulse
	var s: float = lerp(scale.x, target, delta * scale_speed)
	scale = Vector2.ONE * s

	# ===== GLOW =====
	if mat:
		var g: float = mat.get_shader_parameter("glow_strength") as float
		g = lerp(g, _target_glow, delta * glow_speed)
		mat.set_shader_parameter("glow_strength", g)

# ===== STATES =====

func _set_idle():
	_is_hovered = false
	_target_scale = scale_normal
	_target_glow = glow_normal
	if mat:
		mat.set_shader_parameter("animate", 0.0)

func _set_hover():
	_is_hovered = true
	_target_scale = scale_hover
	_target_glow = glow_hover
	focus_sound.play()
	if mat:
		mat.set_shader_parameter("animate", 1.0)

func _set_pressed():
	_is_hovered = true
	_target_scale = scale_hover
	_target_glow = glow_pressed
	click_sound.play()
	if mat:
		mat.set_shader_parameter("animate", 1.0)
		

# ===== EVENTS =====

func _on_mouse_entered():
	grab_focus()  # FORCE focus to follow mouse
	_set_hover()

func _on_mouse_exited():
	if not has_focus():
		_set_idle()

func _on_focus_entered():
	_set_hover()

func _on_focus_exited():
	_set_idle()

func _on_button_down():
	_set_pressed()

func _on_button_up():
	_set_hover()
