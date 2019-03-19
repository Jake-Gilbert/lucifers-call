extends AudioStreamPlayer

var on = true

func _ready():
	self.play()
	on

func stop_playing():
	self.stop()
	on = false