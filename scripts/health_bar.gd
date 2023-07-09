extends Node2D

func init(entity):
	$Bar.texture_over = Classes.bars_front[entity.class_]
	$Bar.texture_progress = Classes.bars_mid[entity.class_]
	$Bar.texture_under = Classes.bars_back[entity.class_]
	update_bar(entity)

func update_bar(entity):
	$Bar.max_value = entity.max_health
	$Bar.value = entity.health
