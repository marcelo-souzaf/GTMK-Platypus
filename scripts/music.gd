extends Node

func start():
	$MusicBase.play()
	for i in range(3):
		get_child(i).play()
	
	$MusicBase.volume_db = -10

func play_music_for_class(class_ : int):
	$MusicBase.volume_db = -5
	for i in range(3):
		get_child(i).volume_db = -80
	get_child(class_).volume_db = -5

func hover():
	$Effects/Hover.play()

func click():
	$Effects/Click.play()
