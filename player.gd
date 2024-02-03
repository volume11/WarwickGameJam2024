extends CharacterBody2D

signal health_changed(health: int)
signal weapon_equipped(weapon)

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
var weapon_durability

var weapons = [load("res://weapons/broadSword.tres"), load("res://weapons/bow.tres")]

var invuln = false

func _ready():
	health = base_hp
	max_health = health
	strength = base_strength
	speed = base_speed
	attack_speed = base_attack_speed
	
	select_weapon(1)
	
	Events.emit_signal("player_health_changed", health)
	Events.emit_signal("player_max_health_changed", max_health)
	
func select_weapon(index: int):
	var weapon = weapons[index]
	weapons.remove_at(index)
	var inst = load("res://weapons/" + weapon.id + ".tscn").instantiate()	
	
	$Weapons.add_child(inst)
	currentWeapon = inst
	weapon_durability = weapon.durability
	Events.emit_signal("player_max_durability_changed", weapon_durability)
	Events.emit_signal("player_durability_changed", weapon_durability)

func _process(delta):
	var nodes = get_tree().get_nodes_in_group("enemy")
	if (len(nodes) > 0):
		target = nodes[0]
	else:
		target = null
		
	if (target != null && currentWeapon != null && Input.is_action_pressed("attack") && $AttackTimer.is_stopped()):
		$AttackTimer.start(base_attack_speed)
		currentWeapon.attack(target)
		weapon_durability -= 1
		Events.emit_signal("player_durability_changed", weapon_durability)
		if (weapon_durability <= 0):
			currentWeapon.queue_free()
			currentWeapon = null
			

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
