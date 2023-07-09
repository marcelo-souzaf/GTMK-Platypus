extends CanvasLayer

const empty = preload("res://assets/ui/Icon_Kill_Empty_32.png")
const full = preload("res://assets/ui/Icon_Kill_Full_32.png")

onready var kills = $Stats/Kills

var slot: Sprite
var width: float
var health_bar: Node2D

func init(health_bar_: Node2D):
	$Stats.add_child(health_bar_)
	health_bar_.init(Game.player)
	health_bar_.position = Vector2(140, 110)
	health_bar_.get_node("Bar").rect_scale = Vector2(1.6, 1.6)
	self.health_bar = health_bar_

func _ready():
	slot = kills.get_child(0).duplicate(false)
	width = slot.get_rect().size.x + 4
	update_skulls()

func update_skulls():
	for kill in kills.get_children():
		kill.texture = empty

	for i in range(kills.get_child_count(), Game.kills_to_level_up):
		# Duplicates without copying the signals, groups, scripts and children
		# This effectively creates a new instance of the child
		var new_slot = slot.duplicate(false)
		new_slot.position.x = width * i
		kills.add_child(new_slot)

func update_stats(class_: int):
	$Stats/Icon.texture = Classes.icons[class_]
	var strong_against = Classes.weakness.find(class_)
	$Stats/StrengthIcon.texture = Classes.icons[strong_against]

	$Stats/Level.text = "Level  %d" % Game.player_level
	if Game.score > 0:
		kills.get_child(Game.score - 1).texture = full
