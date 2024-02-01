extends CharacterBody2D

signal health_changed(health: int)

var target

var base_hp = 10
var base_attack_speed = 1
var base_strength = 1
var base_speed = 300

var health
var max_health
var attack_speed
var strength
var speed

var currentWeapon

var invuln = false

func _ready():
	#temporary
	currentWeapon = $Weapons/Bow
	
	health = base_hp
	max_health = health
	strength = base_strength
	speed = base_speed
	attack_speed = base_attack_speed
	
	Events.emit_signal("player_health_changed", health)
	Events.emit_signal("player_max_health_changed", max_health)
	

func _process(delta):
	var nodes = get_tree().get_nodes_in_group("enemy")
	if (len(nodes) > 0):
		target = nodes[0]
	else:
		target = null
		
	if (target != null && Input.is_action_pressed("attack") && $AttackTimer.is_stopped()):
		$AttackTimer.start(base_attack_speed)
		currentWeapon.attack(target)

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = direction * speed
	move_and_slide()

func knockback(vec):
	pass

func damage(d):
	if (invuln): return
	
	health -= d
	health = max(health, 0)
	Events.emit_signal("player_health_changed", health)
	invuln = true
	$InvulnTimer.start()
	$Sprite2D.modulate = Color(1,0,0)

func heal(h):
	health += h
	health = min(health, max_health)
	Events.emit_signal("player_health_changed", health)

func _on_invuln_timer_timeout():
	invuln = false
	$Sprite2D.modulate = Color(1,1,1)
