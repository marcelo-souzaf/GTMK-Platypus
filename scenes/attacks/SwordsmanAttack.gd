extends Area2D

export var damage := 100
var by_player: bool
var is_zombie: bool

func init(mouse_pos: Vector2, by_player_: bool, is_zombie_: bool = false):
	var direction = mouse_pos - position
	self.rotation = direction.angle()
	self.by_player = by_player_
	self.is_zombie = is_zombie_

func _ready():
	if by_player:
		set_collision_mask_bit(1, true)
		set_collision_mask_bit(2, false)

func _physics_process(_delta):
	for body in self.get_overlapping_bodies():
		if body.has_method("take_damage"):
			body.take_damage(damage, Classes.Zombie if is_zombie else Classes.Swordsman)

func _on_AttackTimer_timeout():
	queue_free()
