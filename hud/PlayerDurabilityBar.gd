extends ProgressBar

func _enter_tree():
	Events.connect("player_durability_changed", _on_durability_changed)
	Events.connect("player_max_durability_changed", _on_max_durability_changed)
	
func _on_durability_changed(durability):
	value = durability
	
func _on_max_durability_changed(max_durability):
	max_value = max_durability

