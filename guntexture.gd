extends TextureRect
@onready var drawgun=$Overworld/Player/Camera2D/UI/Gun/TextureRect/drawgun
@onready var playsound=$Overworld/Player/Camera2D/UI/Gun/TextureRect/drawgun/holstersound
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_drawgun_button_down():
	$drawgun/holstersound.play()
	hide()
	pass # Replace with function body.
