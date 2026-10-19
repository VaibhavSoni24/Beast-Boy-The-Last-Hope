# Contributing to Beast Boy: The Last Hope

First off, thank you for considering contributing to **Beast Boy: The Last Hope**! 🎉

This project is an independent game development venture created and driven by a solo developer (**Vaibhav Soni**). Community feedback, bug reports, and pull requests are warmly appreciated as we build out this universe together.

---

## 📋 Table of Contents

1. [Ground Rules & Mindset](#ground-rules--mindset)
2. [How Can I Contribute?](#how-can-i-contribute)
   - [Reporting Bugs](#reporting-bugs)
   - [Suggesting Features & Gameplay Enhancements](#suggesting-features--gameplay-enhancements)
   - [Contributing Code](#contributing-code)
3. [Development Setup](#development-setup)
4. [Coding & GDScript Style Guide](#coding--gdscript-style-guide)
5. [Scene & Architecture Conventions](#scene--architecture-conventions)
6. [Git Workflow & Pull Requests](#git-workflow--pull-requests)
7. [Licensing of Contributions](#licensing-of-contributions)

---

## 🌟 Ground Rules & Mindset

- **Respect the Creative Vision**: *Beast Boy: The Last Hope* has a defined artistic, cinematic, and narrative direction connected to both the 3D action game and its parallel manhwa adaptation. Contributions should align with this aesthetic and tone.
- **Solo Developer Scope**: Because this project is maintained by a single developer, please be patient with reviews and responses. Keeping PRs focused, modular, and well-documented significantly speeds up the review process.
- **Constructive & Friendly Collaboration**: Treat fellow contributors with kindness, empathy, and respect.

---

## 🛠️ How Can I Contribute?

### Reporting Bugs

Before submitting a bug report, check the existing GitHub Issues to see if the issue has already been reported.

When opening a new issue, please include:
- **Godot Version**: (e.g., Godot 4.4 / 4.6).
- **Operating System & GPU**: (e.g., Windows 11, NVIDIA RTX 3060).
- **Clear Description**: What did you expect to happen versus what actually happened?
- **Steps to Reproduce**: Detailed step-by-step instructions.
- **Terminal / Console Output**: Any Godot error messages, stack traces, or warnings printed to the Output or Debugger dock.
- **Media**: Screenshots or video recordings demonstrating the bug if visual or movement-related.

### Suggesting Features & Gameplay Enhancements

Have ideas for movement mechanics, camera polish, weapon handling, or UI improvements?
- Open an Issue with the prefix `[Feature Request]: ...`.
- Describe the feature clearly and why it enhances the player experience.
- Provide references, mockups, or inspiration if applicable (e.g., how similar mechanics work in games like *Hollow Knight*, *Super Mario*, or *Resident Evil*).

### Contributing Code

1. Pick an open issue or discuss your proposed feature in an issue before writing large amounts of code.
2. Keep pull requests focused on one specific task (e.g., fixing a specific bug or adding a single state).
3. Follow the code and scene guidelines outlined below.

---

## ⚙️ Development Setup

1. **Godot Engine**: Use **Godot 4.6** (or compatible Godot 4.x versions).
2. **Physics Engine**: Verify that Jolt Physics 3D is active as configured in `project.godot`:
   ```ini
   [physics]
   3d/physics_engine="Jolt Physics"
   ```
3. **Renderer**: The project targets **Forward+** (Direct3D 12 on Windows / Vulkan).
4. Run the demo sandbox at `Scenes/Demo/demo_world.tscn` to test character locomotion and physics in real time.

---

## 📜 Coding & GDScript Style Guide

Please follow standard [Godot GDScript Style Conventions](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html):

### 1. Static Typing
Always use static typing for variables, parameters, and function return types:
```gdscript
# Good
var target_speed: float = 10.0
func calculate_velocity(speed: float, delta: float) -> Vector3:
    return direction * speed

# Avoid
var target_speed = 10.0
func calculate_velocity(speed, delta):
    return direction * speed
```

### 2. Naming Conventions
- **Files & Folders**: `snake_case.gd`, `snake_case.tscn`
- **Classes**: `PascalCase` (`class_name MovementStats`)
- **Functions & Variables**: `snake_case` (`calculate_gravity()`, `is_on_floor()`)
- **Constants**: `SCREAMING_SNAKE_CASE` (`PLAYER_MOVEMENT_STATS`)
- **Signals**: Past tense or event descriptions (`finished`, `velocity_updated`, `sprint_started`)

### 3. State Machine Pattern
Player mechanics must follow the decoupled State Machine architecture (`Scripts/StateMachine/`):
- Extend `Motion` for locomotion states.
- Emit signals (`finished.emit("StateName")`, `animation_change_requested.emit(...)`) rather than mutating parent states directly.
- Avoid placing state-specific logic directly in `player.gd` or `player_state_machine.gd`.

### 4. Movement Tuning via Resources
- **Never hardcode speeds, gravity, or jump heights** inside scripts.
- Expose parameters on `MovementStats` (`Scripts/Main/movement_stats.gd`) or edit `Resources/player_movement_stats.tres`.

---

## 🎨 Scene & Architecture Conventions

- **Modular Scenes**: Break down complex scenes into reusable parent scenes (found under `Scenes/Parents/`).
- **Node References**: Prefer `@export var target_node: NodeType` or `%UniqueName` over brittle relative NodePaths (`../../Node`).
- **Audio Routing**: Route all new sound effects and music through the appropriate bus in `AudioServer` (`Master`, `Music`, `UI`, `Enemy`, `Gun`, `Sound`).
- **Shaders**: Keep canvas and spatial shaders performant. If adding uniforms, use helpful hints (`hint_range(0.0, 1.0)`).

---

## 🔀 Git Workflow & Pull Requests

1. **Fork the Repository**:
   Fork `VaibhavSoni24/Beast-Boy-The-Last-Hope` to your personal GitHub account.
2. **Create a Feature Branch**:
   ```bash
   git checkout -b feature/your-feature-name
   # or
   git checkout -b bugfix/issue-description
   ```
3. **Commit Your Changes**:
   Write clear, concise commit messages:
   ```bash
   git commit -m "Add stamina recovery delay after sprinting exhaustion"
   ```
4. **Test Thoroughly**:
   - Ensure the project opens without errors or missing dependency warnings.
   - Test both `Scenes/menu.tscn` and `Scenes/Demo/demo_world.tscn`.
5. **Push and Open a Pull Request**:
   - Push your branch to your fork.
   - Open a Pull Request targeting the `main` branch of `VaibhavSoni24/Beast-Boy-The-Last-Hope`.
   - Provide a clear summary of your changes, referencing any relevant issues.

---

## ⚖️ Licensing of Contributions

By contributing code, art, audio, or documentation to *Beast Boy: The Last Hope*, you agree that your contributions will be licensed under the project's [MIT License](LICENSE).

---

Thank you for helping bring *Beast Boy: The Last Hope* to life! 🚀
