extends KinematicBody2D

onready var attack_timer = $AttackTimer
onready var explosion_area = $ExplosionArea

const FIREBALL_SPEED = 350

var fireball_dir := Vector2.ZERO
var exploding := false
var by_player: bool

func init(direction: Vector2, by_player_: bool):
	fireball_dir = direction.normalized()
	
	self.rotation = fireball_dir.angle()
	self.by_player = by_player_

func _ready():
	if by_player:
		set_collision_mask_bit(1, true)
		set_collision_mask_bit(2, false)

func _physics_process(delta):
	if not exploding:
		var collision = move_and_collide(fireball_dir * FIREBALL_SPEED * delta)

		if collision:
			var body = collision.collider
			if by_player:
				if body != Game.player:
					create_explosion()
			else:
				create_explosion()


func create_explosion():
	$Particles2D.emitting = true
	$Sprite.hide()
	for body in explosion_area.get_overlapping_bodies():
		if body.has_method("take_damage"):
			if by_player:
				if body == Game.player:
					continue
				body.take_damage(Classes.damage[Classes.Mage] * (Game.player_damage + Game.mage_damage), Classes.Mage)
			else:
				body.take_damage(Classes.damage[Classes.Mage], Classes.Mage)
	attack_timer.start()
	exploding = true

func _on_AttackTimer_timeout():
	queue_free()
