extends TextureButton

export var upgrade = 0

var upgrades_list = {
	0 : {
		'name': 'Full Healing',
		'desc': "Who doesn't like a full healing once in a while?"
	},
	1 : {
		'name': 'Archer : Double Shot',
		'desc': "Shoots two arrows at once. Double the shot, double the fun!"
	},
	2 : {
		'name': 'Mage : Speed Boost',
		'desc': "Increases the movement speed of the mage. Gotta go fast!"
	},
	3 : {
		'name': 'Mage : Fireball Speed Boost',
		'desc': "Increases the speed of the fireball. Gotta go faster!"
	},
	4 : {
		'name': 'Mage : Fireball Damage',
		'desc': "Fireball are now insta-kill. Burn baby burn!"
	},
	5 : {
		'name': 'Archer : Arrow Speed Boost',
		'desc': "Increases the speed of the arrow. They're now faster than light!* \n\n *Not really."
	},
	6 : {
		'name': 'Archer : Arrow Damage',
		'desc': "Arrows are now insta-kill. Headshot!"
	},
	7 : {
		'name': 'Archer : Stay for 3 kills',
		'desc': "While as archer, you can stay in his body for 3 kills instead of 1. See them suffer!"
	},
	8 : {
		'name': 'Swordsman : Speed Boost',
		'desc': "Increases the movement speed of the swordsman. Like if he wasn't fast enough!"
	},
	9 : {
		'name': 'Swordsman : Range Boost',
		'desc': "Increases the range of the swordsman. Swords these days are getting longer and longer!"
	},
	10 : {
		'name': 'Swordsman : Vampirism',
		'desc': "Swordsman now heals himself when he kills an enemy. He's a vampire!"
	},
	11 : {
		'name': 'Speed Boost',
		'desc': "Increases by a little the movement speed of all units. Gotta go a little fast!"
	}
}

func _ready():
	self.upgrade = randi() % 12
	if !(upgrade in Game.upgrades):
		$VBoxContainer/Label.text = upgrades_list[upgrade]['name']
		$VBoxContainer/RichTextLabel.text = upgrades_list[upgrade]['desc']
	else:
		hide()

func _on_Panel_pressed():
	Game.upgrade_selected(upgrade)
