extends Node2D
var sideslide = false
func _ready() -> void:
	$SaveSlot1/Thumbnail.texture = SaveManager.load_thumbnail(1)
	$SaveSlot2/Thumbnail.texture = SaveManager.load_thumbnail(2)
	$SaveSlot3/Thumbnail.texture = SaveManager.load_thumbnail(3)
	
	await $AnimationPlayer.animation_finished
	$AnimationPlayer2.play("door")


func _on_play_button_pressed() -> void:
	$AnimationPlayer2.play("zoom cam")
	$Camera2D2.make_current()


func _on_load_button_pressed() -> void:
	if sideslide==false:
		$AnimationPlayer2.play("side buttons")
		sideslide=true
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

func _on_save_slot_1_pressed() -> void:
	pass # Replace with function body.


func _on_save_slot_2_pressed() -> void:
	pass # Replace with function body.


func _on_save_slot_3_pressed() -> void:
	pass # Replace with function body.
