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
				preload("res://scenes/attacks/MageAttack.tscn")]

const acceleration = [800, 800, 800]
const max_speed = [250, 350, 150]
const health = [100, 90, 125, 75]
const attack_cooldown = [0.2, 1, 1.5]
const attack_radius = [50, 300, 150]
const sight_radius = [200, 300, 400]
