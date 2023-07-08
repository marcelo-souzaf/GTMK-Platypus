extends Node2D

func play_music_for_class(class_ : int):
	$MusicBase.volume_db = -5
	$MusicA.volume_db = -80
	$MusicM.volume_db = -80
	$MusicS.volume_db = -80
	
	match class_:
		Classes.Archer:
			$MusicA.volume_db = -5
		Classes.Mage:
			$MusicM.volume_db = -5
		Classes.Swordsman:
			$MusicS.volume_db = -5

func _process(delta):
	print("sounds:")
	for music in [$MusicA, $MusicM, $MusicS]:
		print(music.volume_db)
