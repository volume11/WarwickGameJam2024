extends CharacterBody2D

@export var hp = 5

var target

func _ready():
	target = get_tree().get_nodes_in_group("player")[0]
	$Sprite2D.play("running")

func _process(delta):
	pass

func damage(d):
	hp -= d
	if (hp <= 0):
		queue_free()
