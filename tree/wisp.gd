extends Area2D


#func _process(delta):
	
#	rotation += 0.5 * delta
	
#	pass



func _on_Wisp_body_entered(body):
	GameManager.wisps = GameManager.wisps + 1
	#print(GameManager.metta)
	print(GameManager.wisps)
	$RichTextLabel._setword(GameManager.wisps)
	$AnimatedSprite.play("fade")
	$AnimatedSprite.rotspd = 0
	$CollisionShape2D.queue_free()
