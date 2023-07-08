extends Node2D

onready var arrow = $Arrow

const ARROW_SPEED = 1500

var arrow_dir = Vector2.ZERO
var by_player = false

func _ready():
	if by_player:
		arrow.set_collision_mask_bit(0, false)
	else:
		arrow.set_collision_mask_bit(1, false)

func attack(mouse_pos):
	var direction = mouse_pos - position
	direction = direction.normalized()

	arrow_dir = direction
	arrow.rotation = direction.angle()

func _physics_process(delta):
	var collision = arrow.move_and_collide(arrow_dir * ARROW_SPEED * delta)

	if collision:
		var body = collision.collider
		if by_player and body != Game.player:
			if body.has_method("take_damage"):
					body.take_damage()
			queue_free()





