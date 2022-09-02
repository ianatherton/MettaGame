extends Area2D

func _on_Wisp_body_entered(body):
	var context = get_tree().get_current_scene().filename #load name of current level scene
	#print(context)  #check name of file name
	if body.get_name() == "player": #check name of body collision
		if context == "res://levels/treescene1.tscn":
			GameManager.wisps = GameManager.wisps + 1 #increment global var +1
			if GameManager.metta.size() > GameManager.wisps: #check if array size is big enough for GameManager.wisps index
				#GameManager.wisps = GameManager.wisps + 1
				#print(GameManager.metta)
				print(GameManager.wisps)
				$Label._setword(GameManager.wisps)
				$AnimatedSprite.play("fade")
				$AnimatedSprite.rotspd = 0
				$CollisionShape2D.queue_free()
		if context == "res://levels/breathe.tscn":
			GameManager.breathewisps = GameManager.breathewisps + 1 #increment global var +1
			if GameManager.breathewisps > 7:
				GameManager.breathewisps = 1
			if GameManager.breathewisps <= 7:
			#if GameManager.metta.size() > GameManager.wisps: #check if array size is big enough for GameManager.wisps index
				#GameManager.wisps = GameManager.wisps + 1
				#print(GameManager.metta)
				print("breathewisps:",GameManager.breathewisps)
				$Label._setword(GameManager.breathewisps)
				$AnimatedSprite.play("fade")
				$AnimatedSprite.rotspd = 0
				$CollisionShape2D.queue_free()
		
