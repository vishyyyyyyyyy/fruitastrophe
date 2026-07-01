extends Node2D
var sideslide = false
func _ready() -> void:
	refresh_slots()
	$SaveSlot1/Thumbnail.texture = SaveManager.load_thumbnail(1)
	$SaveSlot2/Thumbnail.texture = SaveManager.load_thumbnail(2)
	$SaveSlot3/Thumbnail.texture = SaveManager.load_thumbnail(3)
	
	await $AnimationPlayer.animation_finished
	$AnimationPlayer2.play("door")


func _on_play_button_pressed() -> void:
	$PlayButton.visible=false
	$LoadButton.visible=false
	$SettingsButton.visible=false
	$QuitButton.visible=false
	$SaveSlot1.visible=false
	$SaveSlot2.visible=false
	$SaveSlot3.visible=false
	$CancelSave.visible=false
	$SaveSlots.visible=false
	$AnimationPlayer2.play("zoom cam")
	$Camera2D2.make_current()
	


func _on_load_button_pressed() -> void:
	if sideslide==false:
		$AnimationPlayer2.play("side buttons")
		sideslide=true
		
	refresh_thumbnails()
	
	$SaveSlot1.visible=true
	$SaveSlot2.visible=true
	$SaveSlot3.visible=true


func _on_settings_button_pressed() -> void:
	if sideslide==false:
		$AnimationPlayer2.play("side buttons")
		sideslide=true
	$SaveSlot1.visible=true
	$SaveSlot2.visible=true
	$SaveSlot3.visible=true



func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_play_button_2_pressed() -> void:
	$SaveSlot3/CancelSave.visible=false
	$SaveSlot3/SaveSlots.visible=false
	$SaveSlot1/CancelSave.visible=false
	$SaveSlot1/SaveSlots.visible=false
	
	$SaveSlot2/CancelSave.visible=true
	$SaveSlot2/SaveSlots.visible=true

var save_choice
func _on_save_slot_1_pressed() -> void:
	save_choice = 1
	$CancelSave.visible=true
	$SaveSlots.visible=true

func _on_save_slot_2_pressed() -> void:
	save_choice = 2
	$CancelSave.visible=true
	$SaveSlots.visible=true



func _on_save_slot_3_pressed() -> void:
	save_choice = 3
	$CancelSave.visible=true
	$SaveSlots.visible=true

func _on_save_slots_pressed() -> void:
	if save_choice == 0:
		return

	await SaveManager.save_game(save_choice)
	refresh_thumbnails()
	refresh_slots()

func refresh_thumbnails():
	$SaveSlot1/Thumbnail.texture = SaveManager.load_thumbnail(1)
	$SaveSlot2/Thumbnail.texture = SaveManager.load_thumbnail(2)
	$SaveSlot3/Thumbnail.texture = SaveManager.load_thumbnail(3)

func refresh_slots():
	for i in range(1, 4):
		var slot = get_node("SaveSlot%d" % i)

		slot.get_node("Thumbnail").texture = SaveManager.load_thumbnail(i)

		var data = SaveManager.get_save_data(i)

		if data:
			var datetime = data["saved_at"].split("T")

			var date = datetime[0].split("-")
			var time = datetime[1].substr(0, 5)

			slot.get_node("Container/Container2/Date").text = "%s/%s/%s" % [date[2], date[1], date[0]]
			slot.get_node("Container/Container2/Time").text = time
