extends KinematicBody2D

enum {
	Swordsman,
	Archer,
	Mage,
}

var type: int = Swordsman

func _ready():
	pass

func attack():
	pass

func on_damage_taken():
	pass

func _physics_process(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
