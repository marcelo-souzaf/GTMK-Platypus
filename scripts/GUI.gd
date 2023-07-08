extends CanvasLayer

const empty = preload("res://assets/ui/Icon_Kill_Empty_32.png")
const full = preload("res://assets/ui/Icon_Kill_Full_32.png")

onready var icon = $Stats/Icon
onready var kills = $Stats/Kills
onready var level = $Stats/Level
onready var strength = $Stats/Strength
onready var strength_icon = $Stats/StrengthIcon

var slot: Sprite
var width: float
var health_bar: Node2D

func init(health_bar_: Node2D):
	self.health_bar = health_bar_
	$Stats.add_child(health_bar)
	health_bar.init(Game.player)

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
	icon.texture = Classes.icons[class_]
	var strong_against = Classes.weakness.find(class_)
	strength_icon = Classes.icons[strong_against]

	level.text = "Level  %d" % Game.player_level
	if Game.score > 0:
		kills.get_child(Game.score - 1).texture = full
