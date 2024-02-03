extends Node2D

@export var arrowScene: PackedScene

func equip():
	pass
	
func destroy():
	pass
	
func attack(target):
	var a = arrowScene.instantiate()
	a.position = global_position
	a.look_at(target.position)
	ObjectAdder.add_object(a)
