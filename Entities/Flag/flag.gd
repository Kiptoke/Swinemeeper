extends Node2D

func _on_flag_influence_area_entered(area):
	if (area.name.findn("Truffle") != -1):
		Globals.TRUFFLE_COUNT += 1
		print("Flag deactivating %s" % area.name)
		area.queue_free()
