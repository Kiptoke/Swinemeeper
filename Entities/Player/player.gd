extends Area2D

@export var flagObject : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse = get_viewport().get_mouse_position()
	set_position(mouse)

func _input(event):
	if (event.is_action_pressed("place_down") and (Globals.FLAG_COUNT < Globals.FLAG_MAX)):
		var flag = flagObject.instantiate()
		flag.position = global_position
		get_parent().add_child(flag)
		Globals.FLAG_COUNT += 1
