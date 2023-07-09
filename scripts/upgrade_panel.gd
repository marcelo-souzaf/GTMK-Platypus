extends TextureButton

export var upgrade = 0

var upgrades_list = {
	0: {
		'name': 'Heal',
		'desc': 'Fully heal your character. Who doesn\'t like a good heal?',
	},
	1: {
		'name': 'Increase Damage',
		'desc': 'Deal +10 damage to the enemies. It\'s not much, but it\'s honest work.',
	},
	2: {
		'name': 'Increase Speed',
		'desc': 'You move a little faster. Gotta go (a little) fast!',
	},
}

func _ready():
	randomize()
	upgrade = randi() % 3
	$VBoxContainer/Label.text = upgrades_list[upgrade]['name']
	$VBoxContainer/RichTextLabel.text = upgrades_list[upgrade]['desc']
	
func _on_Panel_pressed():
	Game.upgrade_selected(upgrade)
