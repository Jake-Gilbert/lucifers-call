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
		alton = true
		on = false
	elif (alton == false):
		Audio._ready()
		on = true
		alton = false
	#self.add_child(player)
	player.stream = load("res://Sound/Scary Horror Music  - Haunted.ogg")
	Audioalt.play()

#Once clicked will mute the music
func _on_MuteCheck_pressed():
	if (on == true):
		Audio.stop_playing()
		on = false
	elif (on == false):
		Audio._ready()
		on = true
	else:
		Audio._ready()
		on = true

	if (alton == true):
		Audioalt.stop_playing()
		on = false
	elif (alton == false):
		Audioalt.start_playing()
		alton = true
	else:
		Audioalt._start_playing()
		alton = true
	


#Changes volume of music
func _on_Volume_percentage_value_changed(value):
	AudioServer.set_bus_volume_db(0,value)

#Sets fullscreen on
func _on_FullscreenCheck_toggled(button_pressed):
	OS.window_fullscreen = !OS.window_fullscreen