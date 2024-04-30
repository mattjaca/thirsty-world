extends StaticBody2D
var bullets = 6
var gunisdrawn: bool
var gunempty: bool
signal shoot;

# Called when the node enters the scene tree for the first time.
func _ready():
	$cylinderfullimage.hide()
	gunisdrawn=false;
	gunempty=false;
	bullets=6;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("left_click")&&gunisdrawn==true:
		$gunshot.play()
		shoot.emit()
	pass


func _on_drawgun_button_down():
	$drawgun/holstersound.play()
	if gunisdrawn==false:
		$inventorygun.hide()
		$cylinderfullimage.show()
		$drawgun/gundrawdelay.start()
	else:
		$inventorygun.show()
		$cylinderfullimage.hide()
		gunisdrawn=false
	pass # Replace with function body.


func _on_gundrawdelay_timeout():
	gunisdrawn=true;
	pass # Replace with function body.
