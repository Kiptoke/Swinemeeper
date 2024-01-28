extends RichTextLabel

func _process(_delta):
	var score = Globals.calculateScore(0)

	text = "[center][font_size=20]%s truffles with %s pigs left gives you...[/font_size]
	[font_size=100][rainbow freq=1.0 sat=0.8 val=0.8]%d[/rainbow][/font_size]
	points[/center]" % [Globals.TRUFFLE_COUNT, Globals.PIG_COUNT, score]
