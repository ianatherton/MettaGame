extends Sprite

func _physics_process(delta):
	#pass
	if $player.faceright == true:
		$butterflysprite.flip_h = false
	if $player.faceright == false:
		$butterflysprite.flip_h = true


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
