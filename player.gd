extends CharacterBody2D

@export var speed = 300

var base_hp
var base_speed
var base_attackSpeed
var base_

var target

func _get_closest_target():
	var nodes = get_tree().get_nodes_in_group("enemy")
	var closest = null
	var distance = null

	for i in nodes:
		var d = position.distance_squared_to(i.position)
		if (closest == null): 
			distance = d
			closest = i
			continue
		if (d < distance):
			distance = d
			closest = i
			
	return closest

func _process(delta):
	if (Input.is_action_just_pressed("target")):
		target = _get_closest_target()
		
	if (target != null && Input.is_action_pressed("attack") && $AttackTimer.is_stopped()):
		$AttackTimer.start()
		
		$BroadSword.rotation = position.angle_to_point(target.position) - PI / 2
		$BroadSword.visible = true
		var tween = create_tween()
		tween.tween_property($BroadSword, "rotation", $BroadSword.rotation + PI, 0.3)
		tween.chain().tween_property($BroadSword, "visible", false, 0)
		

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = direction * speed
	move_and_slide()
