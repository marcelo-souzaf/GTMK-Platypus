extends "./entity.gd"
class_name Enemy

export var tutorial = true
var spawner = null
var player = null

func init(spawner_, enemy_class: int, pos: Vector2 = Vector2.ZERO):
	self.spawner = spawner_
	self.class_ = enemy_class
	self.position = pos
	update_stats()
	if tutorial:
		self.sight_radius /= 1000

func _ready():
	player = Game.player
	if tutorial:
		self.init(null, self.class_, self.position)

func _physics_process(delta):
	var player_dist = player.position.distance_to(self.position)

	# if player is on attack radius
	if player_dist < Classes.attack_radius[class_]:
		if cooldown.is_stopped():
			var direction = player.position - position
			attack(direction)
			sprite.animation = "attack"
		else:
			idle(delta)
	# if player is on sight radius
	elif player_dist < self.sight_radius:
		chase(delta)
	# if player is out of sight radius
	else:
		idle(delta)
	
	lin_speed = move_and_slide(lin_speed)

func take_damage(amount: int, attacker_class: int):
	.take_damage(amount, attacker_class)
	
	if health <= 0:
		if spawner:
			spawner.current_enemies_alive -= 1
		Game.transform_player_into(self)

func chase(delta):
	if sprite.animation == "attack":
		pass
	else:
		sprite.animation = "walk"
	var dir = (player.position - position).normalized()
	if dir.x < 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
	lin_speed += dir * Classes.acceleration[class_] * delta
	lin_speed = lin_speed.limit_length(Classes.max_speed[class_])

func idle(_delta):
	if sprite.animation == "attack":
		pass
	else:
		sprite.animation = "default"
	lin_speed = lin_speed.linear_interpolate(Vector2(), 0.2)


func _on_AnimatedSprite_animation_finished():
	if sprite.animation == "attack":
		sprite.play("default")
