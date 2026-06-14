extends Node2D
func _ready() -> void:
	await $AnimationPlayer.animation_finished
	$AnimationPlayer2.play("door")
