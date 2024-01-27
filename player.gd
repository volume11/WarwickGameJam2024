extends CharacterBody2D

signal health_changed(health: int)

@export var speed = 300

var target

var health = 10
var max_health = 10

var currentWeapon

func _ready():
	currentWeapon = $Weapons/BroadSword

func _process(delta):
	var nodes = get_tree().get_nodes_in_group("enemy")
	if (len(nodes) > 0):
		target = nodes[0]
	else:
		target = null
		
	if (target != null && Input.is_action_pressed("attack") && $AttackTimer.is_stopped()):
		$AttackTimer.start()
		currentWeapon.attack(target)

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = direction * speed
	move_and_slide()
	
func damage(d):
	health -= d
	health = max(health, 0)
	Events.emit_signal("player_health_changed", health)

func heal(h):
	health += h
	health = min(health, max_health)
	Events.emit_signal("player_health_changed", health)
