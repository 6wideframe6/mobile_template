extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const sqlite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")

var db 
var dataPath = "res://data"
var song_id = Global.song_id

# Called when the node enters the scene tree for the first time.
func _ready():
	db = sqlite.new()
	db.path = dataPath
	set_song()

func set_song():
	db.open_db()
	db.query("select * from songs")
	$SongLabel.text = str(db.query_result[song_id]["name"])
	$Panel/ScrollContainer/Label.text = str(db.query_result[song_id]["chords"])
	
