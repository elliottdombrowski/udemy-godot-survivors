extends Node

# Create variable reference to Timer node when the node is ready
@onready var timer = $Timer


func get_time_elapsed():
	return timer.wait_time - timer.time_left
