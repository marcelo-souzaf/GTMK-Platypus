extends Particles2D

func _ready():
	emitting = true
	var timer = get_tree().create_timer(2)
	yield(timer, "timeout")
	queue_free()
