extends CharacterBody2D

@export var speed = 100
@export var chance = 0.6
var target = position
	
func _on_timer_timeout():
	# 1/3 chance the pig moves after 2 seconds
	var flip = randf()
	print("flip is %s" % flip)
	if (flip >= chance):
		target = Vector2(randi_range(0,1152),randi_range(0,648))
		print("%s is the pig target position" % target)

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	if position.distance_to(target) > 10:
		move_and_slide()
