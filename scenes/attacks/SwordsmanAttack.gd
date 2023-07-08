extends Area2D

export var damage := 100
var by_player: bool

func init(mouse_pos: Vector2, by_player_: bool):
	var direction = mouse_pos - position
	self.rotation = direction.angle()
	self.by_player = by_player_

func _ready():
	if by_player:
		set_collision_mask_bit(1, false)

func _physics_process(_delta):
	for body in self.get_overlapping_bodies():
		if body.has_method("take_damage"):
			body.take_damage(damage, 0)

func _on_AttackTimer_timeout():
	queue_free()
