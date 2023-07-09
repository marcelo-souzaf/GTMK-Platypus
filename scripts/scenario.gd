extends StaticBody2D

var num_bodies := 0

func _on_Area2D_body_entered(body: Node):
	if body is Entity:
		num_bodies += 1
		update_transparency()

func _on_Area2D_body_exited(body: Node):
	if body is Entity:
		num_bodies -= 1
		update_transparency()

func update_transparency():
	if num_bodies >= 1:
		self.modulate = Color(1, 1, 1, 0.5)
	else:
		self.modulate = Color(1, 1, 1, 1)
