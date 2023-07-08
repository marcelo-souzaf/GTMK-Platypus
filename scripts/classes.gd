extends Node

# Script that defines the entity classes and the interactions between them.

enum {
	All = -1,
	Swordsman,
	Archer,
	Mage,
	Zombie,
}

# Set the weaknesses of each class in the order they were enumerated
const weakness = [Archer, Mage, Swordsman, All]

const attacks = [preload("res://scenes/attacks/SwordsmanAttack.tscn"),
				preload("res://scenes/attacks/ArcherAttack.tscn"),
				preload("res://scenes/attacks/MageAttack.tscn"),
				preload("res://scenes/attacks/ZombieAttack.tscn")]

const animations = [preload("res://resources/animations/swordsman.tres"),
					preload("res://resources/animations/archer.tres"),
					preload("res://resources/animations/mage.tres"),
					preload("res://resources/animations/zombie.tres")]

const acceleration = [800, 800, 800, 100]
const max_speed = [250, 350, 150, 200]
const health = [100, 90, 125, 75]
const attack_cooldown = [0.2, 1, 1.5, 0.1]
const attack_radius = [75, 300, 150, 100]
const sight_radius = [200, 300, 400, 600]
