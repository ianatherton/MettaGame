extends AnimatedSprite
var rotspd = 0.5

func _process(delta):
	
	rotation += rotspd * delta
	
	pass
