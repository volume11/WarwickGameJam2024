extends ProgressBar

func _ready():
	Events.connect("player_health_changed", _on_hp_changed)
	max_value = 10
	
func _on_hp_changed(health: int):
	value = health
