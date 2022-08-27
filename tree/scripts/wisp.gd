extends Area2D

func _on_Wisp_body_entered(body):
	if body.get_name() == "player": #check name of body collision
		GameManager.wisps = GameManager.wisps + 1 #increment global var +1
		$AnimatedSprite.play("fade") #play fade animation for wisp
		if GameManager.metta.size() > GameManager.wisps: #check if array size is big enough for GameManager.wisps index
			#GameManager.wisps = GameManager.wisps + 1
			#print(GameManager.metta)
			print(GameManager.wisps)
			$Label._setword(GameManager.wisps)
			$AnimatedSprite.play("fade")
			$AnimatedSprite.rotspd = 0
			$CollisionShape2D.queue_free()
