extends KinematicBody2D

var velocity = Vector2(0,0)
var faceright = true #direction player is facing
var word = 0
export var SPEED = 1.5 #gravity constant for falling speed
export var JUMP = -100
#var metta ["this","is","what","should","be","done,","by","one","who","is","skilled","in","goodness","having"]

	


func _physics_process(delta):
	#pass
	if Input.is_action_just_released("mute"):
		if GameManager.mute == false:
			GameManager.mute = true
			$AudioStreamPlayer.playing = false
		else:
			GameManager.mute = false
			$AudioStreamPlayer.playing = true
	if Input.is_action_pressed("up"):
		velocity.y = JUMP
#		$butterflysprite.play("Jump")
	elif Input.is_action_pressed("right"):
		$butterflysprite.flip_h = false # $=accesses child of root node
		$butterflysprite.play("Idle")
		velocity.x = 80
		#print("word:",word)
	elif Input.is_action_pressed("left"):
		$butterflysprite.flip_h = true
		$butterflysprite.play("Idle")
		var faceright = false
		velocity.x = -80
		#print("X:",velocity.x,"Y:", velocity.y)

		#print("player jumping", "X:",velocity.x,"Y:", velocity.y)
	elif Input.is_action_pressed("escape"):
		get_tree().quit()
		
	elif Input.is_action_just_released("f1"):
		OS.set_window_fullscreen(!OS.window_fullscreen)
		print('fullscreen pls')
		
	elif Input.is_action_just_released("f2"): #reset level
		#var context = get_tree().get_current_scene().filename #load name of current level scene
		get_tree().reload_current_scene()
		print('reset level')
	else :
		$butterflysprite.play("Idle")

		
	velocity.y = velocity.y + SPEED #adds speed to y velocity every frame additively
	velocity = move_and_slide(velocity) #updates velocity to itself
	
	#velocity.x = lerp(velocity.x,0,0.005)
