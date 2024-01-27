extends CharacterBody2D

@export var speed = 300

var target

func _process(delta):
	var nodes = get_tree().get_nodes_in_group("enemy")
	if (len(nodes) > 0):
		target = nodes[0]
	else:
		target = null
		
	if (target != null && Input.is_action_pressed("attack") && $AttackTimer.is_stopped()):
		print("attack")
		$AttackTimer.start()
		
		$BroadSword.rotation = 0
		$BroadSword.visible = true
		var tween = create_tween()
		tween.tween_property($BroadSword, "rotation", PI, 0.3)
		tween.chain().tween_property($BroadSword, "visible", false, 0)
		

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = direction * speed
	move_and_slide()
