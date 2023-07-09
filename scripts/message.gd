extends Label

onready var timer = $Timer
onready var anim = $AnimationPlayer

func show_message(text, duration = 5):
	timer.set_wait_time(duration)
	self.text = text
	anim.play("show_up")
	timer.start()

func _on_Timer_timeout():
	anim.play("show_off")
