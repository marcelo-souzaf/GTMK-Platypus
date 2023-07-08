extends "./entity.gd"
class_name Player

func _ready():
	Game.player = self
	Game.game = get_parent()
	self.is_player = true
	update_stats()

func _physics_process(delta):
	# Attack
	if Input.is_action_just_pressed("attack") and cooldown.is_stopped():
		var direction = get_global_mouse_position() - position
		self.attack(direction)

	# Movement
	var moving := false
	if Input.is_action_pressed("move_up"):
		lin_speed.y -= acceleration * delta
		moving = true
	if Input.is_action_pressed("move_down"):
		lin_speed.y += acceleration * delta
		moving = true
	if Input.is_action_pressed("move_left"):
		sprite.flip_h = true
		lin_speed.x -= acceleration * delta
		moving = true
	if Input.is_action_pressed("move_right"):
		sprite.flip_h = false
		lin_speed.x += acceleration * delta
		moving = true
	# Deaccelerate
	if not moving:
		lin_speed = lin_speed.linear_interpolate(Vector2.ZERO, 0.2)
	
	lin_speed = lin_speed.limit_length(max_speed)
	lin_speed = move_and_slide(lin_speed)

func take_damage(amount: int, attacker_class: int):
	.take_damage(amount, attacker_class)
	if self.health <= 0:
		Game.game_over()
