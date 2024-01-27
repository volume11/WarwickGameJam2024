extends CharacterBody2D

@export var hp = 5

var target
var knockback = Vector2.ZERO

func _ready():
	target = get_tree().get_nodes_in_group("player")[0]
	$Sprite2D.play("running")

func _physics_process(delta):
	velocity = (target.position - position).normalized() * 50
	velocity += knockback
	move_and_slide()

func damage(d):
	hp -= d
	knockback = (position - target.position).normalized() * 500
	$KnockbackTimer.start()
	if (hp <= 0):
		queue_free()

func _on_knockback_timer_timeout():
	knockback = Vector2.ZERO

func _on_hit_box_body_entered(body):
	target.damage(1)
