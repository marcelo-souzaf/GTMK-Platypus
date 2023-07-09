extends Particles2D

export var time_lenght : float = 2

func _ready():
	emitting = true
	var timer = get_tree().create_timer(time_lenght)
	yield(timer, "timeout")
	queue_free()
