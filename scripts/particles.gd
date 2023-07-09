extends Particles2D

export var time_length: float = 2

func _ready():
	emitting = true
	var timer = get_tree().create_timer(time_length)
	timer.connect("timeout", self, "_on_Timer_timeout")

func _on_Timer_timeout():
	queue_free()
