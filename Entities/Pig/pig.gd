extends CharacterBody2D

@export var speed = 100
@export var chance = 0.6
@export var truffleOffset = 50
@export var timerMax = 8

var target = position
var trufflePos: Vector2 = Vector2.ZERO
var truffleFlag = false

var levelRangeX = [0, 1152]
var levelRangeY = [0, 648]

func _ready():
	target = position
	
func spawn(rangeX, rangeY):
	position = Vector2(
				randi_range(rangeX[0],rangeX[1]),
				randi_range(rangeY[0],rangeY[1])
			)
	levelRangeX = rangeX
	levelRangeY = rangeY
	$Timer.wait_time = randf_range(1,timerMax)
	
func _on_timer_timeout():
	# 1/3 chance the pig moves after 2 seconds
	var flip = randf()
	if (flip >= chance):
		if (truffleFlag):
			truffleMove()
		else:
			target = Vector2(
				randi_range(levelRangeX[0],levelRangeX[1]),
				randi_range(levelRangeY[0],levelRangeY[1])
			)

func _physics_process(_delta):
	velocity = position.direction_to(target) * speed
	if position.distance_to(target) > 10:
		move_and_slide()

func _on_pig_senses_area_entered(area):
	if (area.name.findn("Truffle") != -1):
		trufflePos = area.position
		truffleFlag = true
		truffleMove()
		
func _on_pig_senses_area_exited(area):
	if (area.name.findn("Truffle") != -1):
		truffleFlag = false

func truffleMove():
	var trufX = trufflePos.x
	var trufY = trufflePos.y
	target = Vector2(
		randi_range(trufX - truffleOffset, trufX + truffleOffset),
		randi_range(trufY - truffleOffset, trufY + truffleOffset)
	)
