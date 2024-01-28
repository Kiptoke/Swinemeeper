extends Node

# Truffles successfully flagged
var TRUFFLE_COUNT = 0

# Number of flags placed down
var FLAG_COUNT = 0 

# Total amount of flags allowed
var FLAG_MAX = 15

# Number of pigs still in the pen
var PIG_COUNT = 100

func calculateScore(secondsLeft):
	return (PIG_COUNT + (10 * TRUFFLE_COUNT)) * ((120 - secondsLeft) / 120)
