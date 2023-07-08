extends Node2D

onready var bar = $Bar

func init(entity):
	bar.texture_over = Classes.bars_front[entity.class_]
	bar.texture_progress = Classes.bars_mid[entity.class_]
	bar.texture_under = Classes.bars_back[entity.class_]
	update_bar(entity)

func update_bar(entity):
	bar.max_value = entity.max_health
	bar.value = entity.health
