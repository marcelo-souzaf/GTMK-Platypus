extends KinematicBody2D

export var damage := 100

const ARROW_SPEED = 1500

var arrow_dir := Vector2.ZERO
var by_player: bool

func init(mouse_pos: Vector2, by_player_: bool):
	var direction = mouse_pos - position
	arrow_dir = direction.normalized()

	self.rotation = arrow_dir.angle()
	self.by_player = by_player_

func _ready():
	if by_player:
		set_collision_mask_bit(0, false)
	else:
		set_collision_mask_bit(1, false)

func _physics_process(delta):
	var collision = move_and_collide(arrow_dir * ARROW_SPEED * delta)

	if collision:
		var body = collision.collider
		if by_player and body != Game.player:
			if body.has_method("take_damage"):
				body.take_damage()
			queue_free()
