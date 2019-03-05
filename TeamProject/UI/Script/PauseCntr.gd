#
#
#

extends Container

func _ready():
	hide()
	
	var pauseButton = get_parent().find_node("PauseBtn")
	if pauseButton:
		pauseButton.connect("pressed", self, "_on_pause")
	
	var resumeButton = get_parent().find_node("ResumeBtn")
	if resumeButton:
		resumeButton.connect("pressed", self, "_on_resume")
	
	pass

func _on_pause():
	show()
	pass

func _on_resume():
	hide()
	pass