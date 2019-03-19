#Created by Hannah
extends Panel

onready var Audio = get_node("/root/AudioPlayer")
onready var Audioalt = get_node("/root/AudioPlayerAlt")
onready var player = AudioStreamPlayer.new()

var on = true
var alton = false

#Once clicked you go back to the mainmenu
func _on_Back_pressed():
	get_tree().change_scene("res://UI/Scenes/TitleScreen.tscn")

#Mutes previous song then changes song
func _on_ChangeSong_pressed():
	if (alton == false):
		Audio.stop_playing()
		Audioalt.play()
		alton = true
		on = false
	elif (alton == false):
		Audioalt.play()
		Audio.stop_playing()
		on = false
		alton = true
	else:
		Audio._ready()
		Audioalt.stop_playing()
		on = true
		alton = false

#Once clicked will mute the music
func _on_MuteCheck_pressed():
	Audio.stop_playing()
	Audioalt.stop_playing()
#	if (on == true):
#		Audio.stop_playing()
#		on = false
#
#	if (alton == true):
#		Audioalt.stop_playing()
#		on = false

#	elif (on == false):
#		Audio._ready()
#		on = true
#	else:
#		Audio._ready()
#		on = true

#	elif (alton == false):
#		Audioalt.start_playing()
#		alton = true
#		on = false
#	else:
#		Audioalt._start_playing()
#		alton = true
#		on = false


#Changes volume of music
func _on_Volume_percentage_value_changed(value):
	AudioServer.set_bus_volume_db(0,value)

#Sets fullscreen on
func _on_FullscreenCheck_toggled(button_pressed):
	OS.window_fullscreen = !OS.window_fullscreen