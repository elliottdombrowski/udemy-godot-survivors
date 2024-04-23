extends Node
class_name HealthComponent

signal died

@export var max_health : float = 10
var current_health 


func _ready():
	current_health = max_health


func damage(damage_amount : float):
	# Make sure current_health is never negative
	current_health = max(current_health - damage_amount, 0)
	Callable(check_death).call_deferred() # Call check_death on next idle frame


func check_death():
	if current_health == 0:
		died.emit()

	# Owner is the node that consitutes the root of the scene this node exists in.
	# In short - if this node is attached to a basic_enemy,
	# that basic_enemy instance is the owner.
	owner.queue_free()
