extends CharacterBody2D

@export var speed = 300

var target

func _process(delta):
	target = get_tree().get_nodes_in_group("enemy")[0]
	if (target != null && Input.is_action_pressed("attack") && $AttackTimer.is_stopped()):
		print("attack")
		$AttackTimer.start()

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = direction * speed
	move_and_slide()
