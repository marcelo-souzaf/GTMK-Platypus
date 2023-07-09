extends "./entity.gd"
class_name Enemy

export var tutorial = true
var player = null
var spawner = null
var dead = false

func init(spawner_, enemy_class: int, pos: Vector2 = Vector2.ZERO):
	self.spawner = spawner_
	self.class_ = enemy_class
	self.position = pos
	update_stats()
	if tutorial:
		self.sight_radius = self.sight_radius / 1000

func _ready():
	player = Game.player

func _physics_process(delta):
	var player_dist = player.position.distance_to(self.position)

	# if player is on attack radius
	if player_dist < Classes.attack_radius[class_]:
		if cooldown.is_stopped() and not dead:
			var direction = player.position - position
			attack(direction)
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
	var dir = (player.position - position).normalized()
	lin_speed += dir * Classes.acceleration[class_] * delta
	lin_speed = lin_speed.limit_length(Classes.max_speed[class_])

func idle(_delta):
	lin_speed = lin_speed.linear_interpolate(Vector2(), 0.2)
