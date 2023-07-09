extends "./entity.gd"
class_name Player

onready var circle = $Circle

func _ready():
	Game.init(self, get_parent().get_parent())
	self.is_player = true
	update_stats()
	Music.start()
	Music.play_music_for_class(self.class_)

func _physics_process(delta):
	# Attack
	var direction := get_global_mouse_position() - position
	if Input.is_action_just_pressed("attack") and cooldown.is_stopped():
		self.attack(direction)
		sprite.animation = "attack"
	
	circle.rotation = direction.angle()
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

	circle.position.x = -20 + 40 * int(sprite.flip_h)
	# Deaccelerate
	if not moving:
		if sprite.animation == "attack":
			pass
		else:
			sprite.animation = "default"
		lin_speed = lin_speed.linear_interpolate(Vector2.ZERO, 0.2)
	else:
		if sprite.animation == "attack":
			pass
		else:
			sprite.animation = "walk"
	
	lin_speed = lin_speed.limit_length(max_speed)
	lin_speed = move_and_slide(lin_speed)

func update_stats():
	.update_stats()
	Game.ui.update_stats(self.class_)

func update_apperance():
	.update_apperance()
	$Circle.modulate = Classes.colors[class_]

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

func _on_AnimatedSprite_animation_finished():
	if sprite.animation == "attack":
		sprite.animation = "default"
