extends CharacterBody2D


var hp = 10

func damage(d):
	hp -= d
	if (hp <= 0):
		queue_free()
