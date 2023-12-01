extends KinematicBody2D
export var speed = 125
onready var game_data = SaveFile.game_data

var velocity = Vector2.ZERO
var sprite
###----------------MY FUNCS--------------------------------###
func backScreen():
	var context = get_tree().get_current_scene().filename
	if context == "res://levels/menu.tscn":
		get_tree().quit()
	else :
		SceneTransition.change_scene("res://levels/menu.tscn")
###--------------------------------------------------------###
func _ready(): ###room start###
	sprite = $butterflysprite
	print('player ready!')
	GameManager.breathewisps = 0
	GameManager.wisps = 0
	if GameManager.mute == false:
		$AudioStreamPlayer.playing = true
		$MusicButton/Sprite.frame = 1
	else:
		$AudioStreamPlayer.playing = false
		$MusicButton/Sprite.frame = 0
	if SaveFile.game_data.has("fullscreenSetting"):
		if SaveFile.game_data["fullscreenSetting"] == 1:
			OS.set_window_fullscreen(true)
		else:
			OS.set_window_fullscreen(false)

func _process(delta): ###every frame###
	var mouse_pos = get_global_mouse_position() # Calculate the direction vector towards the mouse
	var direction = (mouse_pos - global_position).normalized()
	if Input.is_action_just_pressed("escape"):
		backScreen()
	if Input.is_mouse_button_pressed(BUTTON_LEFT): # Move the player towards the mouse when mouse button is held down
		$butterflysprite.speed_scale = 1.1
		velocity = direction * speed
		if direction.x > 0:
			$butterflysprite.flip_h = false
		else:
			$butterflysprite.flip_h = true
	else:
		velocity = Vector2.ZERO
		$butterflysprite.speed_scale = 0.777
		
	velocity = move_and_slide(velocity)
	
	# Rotate the butterfly
	#var rotation_angle = direction.angle_to(Vector2.UP)
	#rotation_angle = clamp(rotation_angle, -deg2rad(90.0), deg2rad(90.0)) # Limit rotation angle to -45 to 45 degrees
	#$butterflysprite.rotation = rotation_angle
###----------UI INPUTS------------------###
func _on_ExitButton_pressed():
	backScreen()
func _on_FullscreenButton_pressed():
	if OS.is_window_fullscreen():
		SaveFile.game_data["fullscreenSetting"] = 0
		OS.set_window_fullscreen(false)
	else:
		SaveFile.game_data["fullscreenSetting"] = 1
		OS.set_window_fullscreen(true)
	SaveFile.save_data()
	print('fullscreen pls!')
	
func _on_RestartButton_pressed():
	get_tree().reload_current_scene()
	print('reset level pls!')
	
func _on_MusicButton_pressed():
	if GameManager.mute == false:
		GameManager.mute = true
		SaveFile.game_data["musicSetting"] = 1
		SaveFile.save_data()
		$AudioStreamPlayer.playing = false
		$MusicButton/Sprite.frame = 0
	else:
		GameManager.mute = false
		SaveFile.game_data["musicSetting"] = 0
		SaveFile.save_data()
		$AudioStreamPlayer.playing = true
		$MusicButton/Sprite.frame = 1
	
