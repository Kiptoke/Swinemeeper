extends RichTextLabel

var total = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	total = get_parent().get_parent().pigNum

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "[b]Pigs Left:[/b] %s of %s" % [Globals.PIG_COUNT,total]
