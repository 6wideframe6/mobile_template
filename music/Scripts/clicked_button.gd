extends VBoxContainer

const sqlite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")

var db 
var dataPath = "res://data"
var song_id := 0

func _ready():
	db = sqlite.new()
	db.path = dataPath
	insert_data()
	

func insert_data():
	db.open_db()
	db.query("select * from songs")
	add_constant_override("separation", 10)
	for i in range(0, db.query_result.size()):
		var button := Button.new()
		var dynamic_font = DynamicFont.new()
		dynamic_font.font_data = load("res://Fonts/couriercyrps_boldinclined.ttf")
		dynamic_font.size = 21
		button.set("custom_fonts/font", dynamic_font)
		button.set_name(str(i))
		#var button = button_pck.instance()
		#button.set_song_id(db.query_result[i]["ID"])
		button.rect_min_size = Vector2(496, 100)
		button.text = str(db.query_result[i]["name"])
		button.connect("pressed", self, "_button_pressed", [button])
		add_child(button)
		
		
		
func _button_pressed(button):
	print(button.name)
	Global.song_id = int(button.name)
	get_tree().change_scene("res://Scenes/song.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



