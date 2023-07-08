extends Node

# Script that defines the entity classes and the interactions between them.

enum {
	Swordsman,
	Archer,
	Mage,
}

# Set the weaknesses of each class in the order they were enumerated
const weakness = [Archer, Mage, Swordsman]
const strength = [Mage, Swordsman, Archer]
const attacks = [preload("res://scenes/attacks/SwordsmanAttack.tscn"),
				preload("res://scenes/attacks/ArcherAttack.tscn"),
				preload("res://scenes/attacks/MageAttack.tscn")]

const speeds = [300, 200, 100]
const attack_radius = [50, 300, 150]
