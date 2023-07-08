extends "./entity.gd"
class_name Enemy

var player = null

func _ready():
	player = Game.player

func _process(delta):
	var player_dist = player.position.distance_to(position)

	# if player is on attack radius
	if player_dist < Classes.attack_radius[class_]:
		attack(player.position)
	# if player is on sight radius
	elif player_dist < Classes.sight_radius[class_]:
		chase(delta)
	# if player is out of sight radius
	else:
		idle(delta)
	
	lin_speed = move_and_slide(lin_speed)

func chase(delta):
	var dir = (player.position - position).normalized()
	lin_speed += dir * Classes.acceleration[class_] * delta
	lin_speed = lin_speed.limit_length(Classes.max_speed[class_])

func idle(_delta):
	lin_speed = lin_speed.linear_interpolate(Vector2(), 0.2)
