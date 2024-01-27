extends CharacterBody2D

func _ready():
	velocity = transform.basis_xform(Vector2.RIGHT) * 300

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if (collision):
		if (collision.get_collider()):
			var a = collision.get_collider()
			if (a.is_in_group("enemy")):
				a.damage(1)
			
			queue_free()
