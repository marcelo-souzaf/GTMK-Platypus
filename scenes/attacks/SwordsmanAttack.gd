extends Area2D

var by_player: bool
var class_: int

func init(direction: Vector2, by_player_: bool, is_zombie_: bool = false):
	self.rotation = direction.angle()
	self.by_player = by_player_
	class_ = Classes.Zombie if is_zombie_ else Classes.Swordsman

func _ready():
	$AttackTimer.start()
	if by_player:
		set_collision_mask_bit(1, true)
		set_collision_mask_bit(2, false)

func _on_AttackArea_body_entered(body):
	if body is Entity:
		if by_player:
			body.take_damage(Classes.damage[class_] * 3, class_)
		else:
			body.take_damage(Classes.damage[class_], class_)

func _on_AttackTimer_timeout():
	queue_free()
