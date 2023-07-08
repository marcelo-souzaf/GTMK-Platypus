extends StaticBody2D

var num_body = 0

func _on_Area2D_body_entered(body:Node):
	if body.name.split(" ")[0] == "Scenario":
		return
	num_body += 1
	update_transparency()


func _on_Area2D_body_exited(body:Node):
	if body.name.split(" ")[0] == "Scenario":
		return
	num_body -= 1
	update_transparency()

func update_transparency():
	if num_body > 0:
		self.modulate = Color(1, 1, 1, 0.5)
	else:
		self.modulate = Color(1, 1, 1, 1)
