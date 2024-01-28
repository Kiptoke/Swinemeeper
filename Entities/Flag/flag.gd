extends Node2D

func _on_flag_influence_area_entered(area):
	if (area.name.findn("Truffle") != -1):
		Globals.TRUFFLE_COUNT += 1
		area.queue_free()
