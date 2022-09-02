extends Label



func _setword(a):
	#set_text("tester")
	#check here if 
	var context = get_tree().get_current_scene().filename
	print(context)
	if context == "res://levels/treescene1.tscn": #load name of current level scene
	#if GameManager.metta.count() > a:
		set_text(GameManager.metta[a])
		pass
	elif context == "res://levels/breathe.tscn":
		set_text(GameManager.breathemantra[a])
		pass
