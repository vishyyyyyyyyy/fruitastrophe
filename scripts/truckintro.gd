extends Node2D
func _ready() -> void:
	await $AnimationPlayer.animation_finished
	$AnimationPlayer2.play("door")


func _on_play_button_pressed() -> void:
	$AnimationPlayer2.play("zoom cam")
	$Camera2D2.make_current()


func _on_load_button_pressed() -> void:
	pass # Replace with function body.


func _on_settings_button_pressed() -> void:
	pass # Replace with function body.


func _on_quit_button_pressed() -> void:
	get_tree().quit()
