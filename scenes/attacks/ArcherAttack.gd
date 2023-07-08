extends KinematicBody2D

const ARROW_SPEED = 1500

var arrow_dir := Vector2.ZERO
var by_player: bool

func init(direction: Vector2, by_player_: bool):
	arrow_dir = direction.normalized()

	self.rotation = arrow_dir.angle()
	self.by_player = by_player_

func _ready():
	if by_player:
		set_collision_mask_bit(1, true)
		set_collision_mask_bit(2, false)

func _physics_process(delta):
	var collision = move_and_collide(arrow_dir * ARROW_SPEED * delta)

	if collision:
		var body = collision.collider
		if by_player and body != Game.player:
			if body.has_method("take_damage"):
				body.take_damage(Classes.damage[Classes.Archer] * 3, Classes.Archer)
		elif not by_player and body == Game.player:
			if body.has_method("take_damage"):
				body.take_damage(Classes.damage[Classes.Archer], Classes.Archer)
		queue_free()
