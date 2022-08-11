extends Area2D


#func _process(delta):
	
#	rotation += 0.5 * delta
	
#	pass



func _on_Wisp_body_entered(body):
	#$player.word +1 #increase player word var by 1
	queue_free()
