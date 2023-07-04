extends KinematicBody2D
export var speed = 150

var velocity = Vector2.ZERO
var sprite
###----------------MY FUNCS--------------------------------###
func _backScreen():
	var context = get_tree().get_current_scene().filename
	if context == "res://levels/menu.tscn":
		get_tree().quit()
	else :
		SceneTransition.change_scene("res://levels/menu.tscn")
###--------------------------------------------------------###
func _ready(): ###room start###
	sprite = $ButterflySprite
	print('player ready!')
	GameManager.breathewisps = 0
	GameManager.wisps = 0

func _process(delta): ###every frame###
	var mouse_pos = get_global_mouse_position() # Calculate the direction vector towards the mouse
	var direction = (mouse_pos - global_position).normalized()
	if Input.is_action_just_pressed("escape"):
		_backScreen()
	if Input.is_mouse_button_pressed(BUTTON_LEFT): # Move the player towards the mouse when mouse button is held down
		velocity = direction * speed
		if direction.x > 0:
			$butterflysprite.flip_h = false
		else:
			$butterflysprite.flip_h = true
	else:
		velocity = Vector2.ZERO
		
	velocity = move_and_slide(velocity)
###----------UI INPUTS------------------###
func _on_ExitButton_pressed():
	_backScreen()
func _on_FullscreenButton_pressed():
	OS.set_window_fullscreen(!OS.window_fullscreen)
	print('fullscreen pls!')
	
func _on_RestartButton_pressed():
	get_tree().reload_current_scene()
	print('reset level pls!')
	
func _on_MusicButton_pressed():
	if GameManager.mute == false:
		GameManager.mute = true #mute
		$AudioStreamPlayer.playing = false #mute
	else:
		GameManager.mute = false #unmute
		$AudioStreamPlayer.playing = true #unmute
