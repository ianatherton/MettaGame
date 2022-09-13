extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_portal_body_entered(body):
	var context = get_tree().get_current_scene().filename #load name of current level scene
	print(context)  #check name of file name
	if body.get_name() == "player": #check name of body collision
		get_tree().change_scene("res://levels/breathe.tscn")
