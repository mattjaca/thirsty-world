extends StaticBody2D
var bullets = 6
var gunisdrawn: bool
var gunempty: bool
signal shoot;

# Called when the node enters the scene tree for the first time.
func _ready():
	$cylinderfullimage.hide()
	$cylinder4shots.hide()
	$cylinder5shots.hide()
	$cylinder2shots.hide()
	$cylinder3shots.hide()
	$cylinder1shots.hide()
	$cylinder0shots.hide()
	gunisdrawn=false;
	gunempty=false;
	bullets=6;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("left_click")&&gunisdrawn==true && bullets>0:
		$gunshot.play()
		bullets=bullets-1
		shoot.emit()
	pass


func _on_drawgun_button_down():
	$drawgun/holstersound.play()
	if gunisdrawn==false:
		$inventorygun.hide()
		if bullets==6:
			$cylinderfullimage.show()
		if bullets==5:
			$cylinder5shots.show()
		if bullets==4:
			$cylinder4shots.show()
		if bullets==3:
			$cylinder3shots.show()
		if bullets==2:
			$cylinder2shots.show()
		if bullets==1:
			$cylinder1shots.show()
		if bullets==0:
			$cylinder0shots.show()
		$drawgun/gundrawdelay.start()
	else:
		$inventorygun.show()
		$cylinderfullimage.hide()
		$cylinder5shots.hide()
		$cylinder4shots.hide()
		$cylinder3shots.hide()
		$cylinder2shots.hide()
		$cylinder1shots.hide()
		$cylinder0shots.hide()
		gunisdrawn=false
	pass # Replace with function body.


func _on_gundrawdelay_timeout():
	gunisdrawn=true;
	pass # Replace with function body.


func _on_shoot():
	if bullets==5:
		$cylinderfullimage.hide()
		$cylinder5shots.show()
	if bullets==4:
		$cylinder5shots.hide()
		$cylinder4shots.show()
	if bullets==3:
		$cylinder4shots.hide()
		$cylinder3shots.show()
	if bullets==2:
		$cylinder3shots.hide()
		$cylinder2shots.show()
	if bullets==1:
		$cylinder2shots.hide()
		$cylinder1shots.show()
	if bullets==0:
		$cylinder1shots.hide()
		$cylinder0shots.show()
	pass # Replace with function body.





func _on_area_2d_2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	bullets=6
	pass # Replace with function body.
