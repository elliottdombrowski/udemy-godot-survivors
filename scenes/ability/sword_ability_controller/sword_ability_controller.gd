extends Node

# Specify scene that corresponds to sword ability
@export var sword_ability: PackedScene # : type

# Called when the node enters the scene tree for the first time.
func _ready():
	#get_node("Timer")
	$Timer.timeout.connect(on_timer_timeout) # $ - shorthand for get_node()


func on_timer_timeout():
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
	
	var sword_instance = sword_ability.instantiate() as Node2D
	player.get_parent().add_child(sword_instance)
	sword_instance.global_position = player.global_position
