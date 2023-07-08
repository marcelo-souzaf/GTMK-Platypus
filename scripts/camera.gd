extends Camera2D

func _ready():
	Game.cam = self

func _process(delta):
	position = Game.player.position
