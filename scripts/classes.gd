extends Node

# Script that defines the entity classes and the interactions between them.

enum {
	All = -1,
	Swordsman,
	Archer,
	Mage,
	Zombie,
}

const num_to_name = [
	"Swordsman",
	"Archer",
	"Mage",
	"Zombie",
]

const name_to_num = {
	"Swordsman": Swordsman,
	"Archer": Archer,
	"Mage": Mage,
	"Zombie": Zombie,
}

# Set the weaknesses of each class in the order they were enumerated
const weakness = [Archer, Mage, Swordsman, All]

const attacks = [
	preload("res://scenes/attacks/SwordsmanAttack.tscn"),
	preload("res://scenes/attacks/ArcherAttack.tscn"),
	preload("res://scenes/attacks/MageAttack.tscn"),
	preload("res://scenes/attacks/ZombieAttack.tscn")
]

const animations = [
	preload("res://resources/animations/Swordsman.tres"),
	preload("res://resources/animations/Archer.tres"),
	preload("res://resources/animations/Mage.tres"),
	preload("res://resources/animations/Zombie.tres")
]

const icons = [
	preload("res://assets/ui/Swordsman.png"),
	preload("res://assets/ui/Archer.png"),
	preload("res://assets/ui/Mage.png")
]

const bars_front = [
	preload("res://assets/life_bars/S_HP_Front.png"),
	preload("res://assets/life_bars/A_HP_Front.png"),
	preload("res://assets/life_bars/M_HP_Front.png"),
]

const bars_mid = [
	preload("res://assets/life_bars/S_HP_Mid.png"),
	preload("res://assets/life_bars/A_HP_Mid.png"),
	preload("res://assets/life_bars/M_HP_Mid.png"),
]

const bars_back = [
	preload("res://assets/life_bars/S_HP_Back.png"),
	preload("res://assets/life_bars/A_HP_Back.png"),
	preload("res://assets/life_bars/M_HP_Back.png"),
]

const acceleration = [800, 800, 800, 100]
const damage = [50, 20, 40, 10]
const max_speed = [200, 150, 100, 200]
const health = [100, 100, 100, 100]
const attack_cooldown = [0.6, 2, 1, 0.5]
const attack_radius = [100, 500, 500, 100]
const sight_radius = [1000000, 700000, 600000, 200000]
