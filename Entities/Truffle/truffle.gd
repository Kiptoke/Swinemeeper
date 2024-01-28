extends Area2D

@export var pigExplosionCount = 5
@export var explosionScene : PackedScene

var pigCount = 0
var exploding = false

func spawn(rangeX, rangeY):
	position = Vector2(
				randi_range(rangeX[0],rangeX[1]),
				randi_range(rangeY[0],rangeY[1])
				)

func _on_area_entered(area):
	if (area.name.findn("Pig") != -1 and not exploding):
		pigCount += 1
		if pigCount > pigExplosionCount:
			$Timer.start()
			print("%s has activated" % name)
			exploding = true

func _on_timer_timeout():
	var exp = explosionScene.instantiate()
	exp.position = global_position
	get_parent().add_child(exp)
	
	var test = []
	for p in $ExplosionRadius.get_overlapping_bodies():
		test.append(p.name)
		p.queue_free()
		Globals.PIG_COUNT -= 1
	print("%s has gone kablooey and destroyed %s" % [name, test])
	self.queue_free()

func _on_area_exited(area):
	if area.name.findn("Pig") != -1:
		pigCount -= 1
