extends "./entity.gd"
class_name Player

func _ready():
	Game.player = self
	Game.game = get_parent()

	set_collision_layer_bit(0, true)
	set_collision_mask_bit(0, true)
	set_collision_layer_bit(1, false)
	set_collision_mask_bit(1, false)

func _process(delta):
	# Attack
	if Input.is_action_just_pressed("attack"):
		self.attack(get_global_mouse_position(), true)

	# Movement
	var moving = false
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
		lin_speed = lin_speed.linear_interpolate(Vector2(), 0.2)
	
	lin_speed = lin_speed.limit_length(max_speed)
	lin_speed = move_and_slide(lin_speed)
