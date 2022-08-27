extends KinematicBody2D

var velocity = Vector2(0,0)
var faceright = true #direction player is facing
var word = 0
const SPEED = 2.3 #gravity constant for falling speed
const JUMP = -100
#var metta ["this","is","what","should","be","done,","by","one","who","is","skilled","in","goodness","having"]

	


func _physics_process(delta):
	#pass
	if Input.is_action_pressed("up"):
		velocity.y = JUMP
#		$butterflysprite.play("Jump")
	elif Input.is_action_pressed("right"):
		$butterflysprite.flip_h = false # $=accesses child of root node
		$butterflysprite.play("Idle")
		velocity.x = 100
		#print("word:",word)
	elif Input.is_action_pressed("left"):
		$butterflysprite.flip_h = true
		$butterflysprite.play("Idle")
		var faceright = false
		velocity.x = -100
		#print("X:",velocity.x,"Y:", velocity.y)

		#print("player jumping", "X:",velocity.x,"Y:", velocity.y)
	else :
		$butterflysprite.play("Idle")

		
	velocity.y = velocity.y + SPEED #adds speed to y velocity every frame additively
	velocity = move_and_slide(velocity) #updates velocity to itself
	
	velocity.x = lerp(velocity.x,0,0.005)
