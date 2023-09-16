extends Node

const SAVE_FILE = "user://save_file.save" #unchanging name for general save file, with path relative to game directory
var game_data = {} #empty dictionary to fill with variables I want to save

func _ready():
	pass

func save_data():
		var file = File.new()
		file.open(SAVE_FILE, file.WRITE) #open file "SAVE_FILE"
		file.store_var(game_data) #store g_data(all saved variables) in the open file
		file.close()

func load_data(): #load in all data we previously had saved
	var file = File.new() #variable for save file
	if not file.file_exists(SAVE_FILE): #if there is no file saved with name SAVE_FILE
		game_data = { #fill saved variable dictionary
			"musicSetting": 1, #variables i want to save
			"fullscreenSetting": 0
		}
		save_data()
	file.open(SAVE_FILE, File.READ)
	game_data = file.get_var()
	file.close()
