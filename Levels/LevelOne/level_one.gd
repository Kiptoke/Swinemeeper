extends Node2D

@export var truffleMax = 15
@export var pigNum = 100
@export var pigScene: PackedScene
@export var truffleScene: PackedScene

@onready var penArea = $Pen/CollisionShape2D.shape.size
@onready var penPos = $Pen/CollisionShape2D.global_position - $Pen/CollisionShape2D.shape.extents

var truffleIndex = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print("%s %s" % [penPos, penArea])
	resetGame()
	pigSpawn()
	truffleSpawn(0)

func resetGame():
	Globals.TRUFFLE_COUNT = 0
	Globals.FLAG_COUNT = 0
	Globals.PIG_COUNT = pigNum
	
func pigSpawn():
	for n in pigNum:
		var pig = pigScene.instantiate()
		pig.name = "Pig%s" % n
		pig.spawn(
			[penPos.x, penPos.x + penArea.x],
			[penPos.y, penPos.y + penArea.y]
		)
		$PigPool.add_child(pig)
	
func truffleSpawn(n):
	var margin = 30
	var truf = truffleScene.instantiate()
	truf.name = "Truffle%s" % n
	truf.spawn(
		[penPos.x + margin, penPos.x + penArea.x - margin],
		[penPos.y + margin, penPos.y + penArea.y - margin]
	)
	$Truffles.add_child(truf)
	truffleIndex += 1

# Spawn a truffle every 8 seconds
func _on_truffle_timer_timeout():
	if(truffleIndex < truffleMax):
		truffleSpawn(truffleIndex)

# End the game after 2 minutes (120 seconds)
func _on_game_timer_timeout():
	get_tree().paused = true

func _on_button_pressed():
	get_tree().reload_current_scene()
