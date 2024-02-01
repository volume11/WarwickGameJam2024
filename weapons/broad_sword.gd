class_name BroadSword extends Area2D

var player

func _ready():
	player = get_tree().get_first_node_in_group("player")

func attack(target):
	player.damage(player.strength)
	rotation = player.position.angle_to_point(target.position) - PI / 2
	visible = true
	monitoring = true
	
	var tween = create_tween()
	tween.tween_property(self, "rotation", self.rotation + PI, 0.3)
	tween.chain().tween_property(self, "visible", false, 0)
	tween.chain().tween_property(self, "monitoring", false, 0)
	
func _on_body_entered(body):
	body.damage(player.strength)
	player.heal(player.strength)
