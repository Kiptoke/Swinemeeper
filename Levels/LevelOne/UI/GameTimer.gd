extends Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$RichTextLabel.text = "[b]Time Left:[/b] %d" % time_left
