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
const damage = [20, 40, 10, 10]
const max_speed = [200, 150, 100, 200]
const health = [100, 90, 125, 75]
const attack_cooldown = [0.2, 1, 1.5, 0.1]
const attack_radius = [100, 500, 500, 100]
const sight_radius = [1000, 700, 600, 2000]
