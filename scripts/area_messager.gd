extends Area2D

export var message = "Hello World!"
export var time = 5
export var start_waves = false



func _on_Area2D_body_entered(body:Node):
	if body.name == 'Player':
		Game.message_sys.show_message(message, time)
		if start_waves:
			var timer = get_tree().create_timer(3, false)
			yield(timer, "timeout")
			Game.call_wave()
