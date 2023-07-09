extends StaticBody2D

var num_bodies := 0
var decreasing := false

func _ready():
	set_physics_process(false)

func _physics_process(_delta):
	if decreasing:
		if modulate.a > 0.5:
			modulate.a -= 0.025
			return
	else:
		if modulate.a < 1:
			modulate.a += 0.025
			return
	set_physics_process(false)

func _on_Area2D_body_entered(body: Node):
	if body is Entity:
		num_bodies += 1
		update_transparency()

func _on_Area2D_body_exited(body: Node):
	if body is Entity:
		num_bodies -= 1
		update_transparency()

func update_transparency():
	if num_bodies <= 1:
		decreasing = not decreasing
		set_physics_process(true)
	else:
		self.modulate = Color(1, 1, 1, 1)
