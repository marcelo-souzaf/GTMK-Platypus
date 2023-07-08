extends "./entity.gd"
class_name Player

func _ready():
	Game.init(self, get_parent().get_parent())
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

func update_stats():
	.update_stats()
	Game.ui.update_stats(self.class_)

func take_damage(amount: int, attacker_class: int):
	if not $Invulnerability.is_stopped():
		return
	.take_damage(amount, attacker_class)
	Game.ui.health_bar.update_bar(self)
	
	if self.health <= 0:
		Game.game_over()
		return
	become_invulnerable()

func _on_Invulnerability_timeout():
	sprite.material = null
