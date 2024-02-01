extends ProgressBar

func _enter_tree():
	Events.connect("player_health_changed", _on_hp_changed)
	Events.connect("player_max_health_changed", _on_max_hp_changed)
	
func _on_hp_changed(health: int):
	value = health

func _on_max_hp_changed(max_health: int):
	max_value = max_health
