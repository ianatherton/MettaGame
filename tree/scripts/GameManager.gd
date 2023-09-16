extends Node
#game built in godot 3.5.2
var mute = false
var breathewisps = 0
var wisps = 0
var metta = ["null","This","is","what","should","be","done","By","one","who","is","skilled","in","goodness,","Having","glimpsed","the","state","of","perfect","peace:","Let","them","be","honest","and","upright,","Straightforward","and","gentle","in","speech,","Humble","and","not","conceited,","Contented","and","easily","satisfied","Unburdened","with","duties","and","frugal","in","their","ways","Peaceful","and","calm","and","wise","and","skillful,","Not","proud","or","demanding","in","nature","Let","them","not","do","the","slightest","thing","That","the","wise","would","later","reprove","Wishing:","in","gladness","and","in","safety,","May","all","beings","be","happy.","Whatever","living","beings","there","may","be;","Whether","they","are","weak","or","strong","excluding","none,","The","great","or","the","mighty,","medium,","short,","or","small.","The","seen","and","the","unseen","Those","living","near","and","far","away,","Those","born","and","to-be-born","May","all","beings","be","at","ease!","Let","none","deceive","another,","Or","despise","any","being","in","any","state","Let","none","through","anger","or","ill-will","Wish","harm","upon","another","Even","as","a","mother","protects","with","her","life","Her","child,","her","only","child","So","with","a","boundless","heart","Should","one","cherish","all","living","beings;","Cultivate","a","limitless","heart","of","goodwill","For","all","throughout","the","cosmos","In","all","its","height,","depth,","and", "breadth -","A","love","that","is","untroubled","And","beyond","hatred","and","ill-will","Whether","standing","or","walking,","seated","or","lying","down","So","long","as","you","are","awake,","One","should","sustain","this","recollection","This","is","the","noblest","way","of","living","Free","from","wrong","views,","greed,","and","sensual","desires,","living","in","beauty","and","realizing","perfect","understanding,","those","who","practice","boundless","love","will","certainly","transcend","birth","and","death."]
var breathemantra2 = ["null","Breathe in,","aware.","Breathe out,","aware."] #words to inspire attention, attentiveness, calmness, observing.
var breathemantra = ["null","Breathing","in,","I","enjoy","my","in-breath.","Breathing","out,","I","enjoy","my","out-breath."]
var vo = true

func _ready():
	SaveFile.load_data()
	if SaveFile.game_data.has("musicSetting"):
		print('loaded save file')
		if SaveFile.game_data["musicSetting"] == 0:
			print('read from save file')
			mute = false
		else:
			print('read from save file')
			mute = true
