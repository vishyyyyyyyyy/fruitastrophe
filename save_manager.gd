extends Node

const SAVE_FOLDER = "user://"

var high_score = 0
var coins = 0

#func _ready():
	##$SaveSlot1.set_meta("slot_id", 1)
	##$SaveSlot2.set_meta("slot_id", 2)
	##$SaveSlot3.set_meta("slot_id", 3)
	
func save_game(slot: int):
	var path = SAVE_FOLDER + "save_%d.json" % slot

	var data = {
		"high_score": high_score,
		"coins": coins
	}

	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(JSON.stringify(data))

func load_game(slot: int):
	var path = SAVE_FOLDER + "save_%d.json" % slot

	if not FileAccess.file_exists(path):
		return false

	var file = FileAccess.open(path, FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())

	high_score = data["high_score"]
	coins = data["coins"]

	return true


func save_screenshot(slot: int):
	var image = get_viewport().get_texture().get_image()

	var path = "user://save_%d.png" % slot
	image.save_png(path)

func load_thumbnail(slot: int) -> Texture2D:
	var path = "user://save_%d.png" % slot

	if not FileAccess.file_exists(path):
		return null

	var image = Image.load_from_file(path)
	return ImageTexture.create_from_image(image)
