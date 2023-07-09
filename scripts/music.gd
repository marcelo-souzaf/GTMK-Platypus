extends Node

func start():
	for i in range(3):
		get_child(i).play()
	
	$MusicBase.volume_db = -10

func play_music_for_class(class_ : int):
	$MusicBase.volume_db = -5
	for i in range(3):
		get_child(i).volume_db = -80
	get_child(class_).volume_db = -5
	
#	$MusicA.volume_db = -80
#	$MusicM.volume_db = -80
#	$MusicS.volume_db = -80
	
#	match class_:
#		Classes.Archer:
#			$MusicA.volume_db = -5
#		Classes.Mage:
#			$MusicM.volume_db = -5
#		Classes.Swordsman:
#			$MusicS.volume_db = -5

func hover():
	$Effects/Hover.play()

func click():
	$Effects/Click.play()
