extends Node2D

onready var bar = $Bar

var bars_back = {
	Classes.Swordsman: preload("res://assets/life_bars/S_HP_Back.png"),
	Classes.Archer: preload("res://assets/life_bars/A_HP_Back.png"),
	Classes.Mage: preload("res://assets/life_bars/M_HP_Back.png"),
}
var bars_mid = {
	Classes.Swordsman: preload("res://assets/life_bars/S_HP_Mid.png"),
	Classes.Archer: preload("res://assets/life_bars/A_HP_Mid.png"),
	Classes.Mage: preload("res://assets/life_bars/M_HP_Mid.png"),
}
var bars_front = {
	Classes.Swordsman: preload("res://assets/life_bars/S_HP_Front.png"),
	Classes.Archer: preload("res://assets/life_bars/A_HP_Front.png"),
	Classes.Mage: preload("res://assets/life_bars/M_HP_Front.png"),
}

func init(entity):
	bar.texture_over = bars_front[entity.class_]
	bar.texture_progress = bars_mid[entity.class_]
	bar.texture_under = bars_back[entity.class_]
	update_bar(entity)

func update_bar(entity):
	bar.max_value = entity.max_health
	bar.value = entity.health
