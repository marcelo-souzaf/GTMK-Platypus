extends Area2D

export var message = "Hello World!"
export var time = 5



func _on_Area2D_body_entered(body:Node):
	if body.name == 'Player':
		Game.message_sys.show_message(message, time)
