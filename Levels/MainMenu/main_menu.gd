extends Control

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Levels/LevelOne/level_one.tscn")
	#self.queue_free()
