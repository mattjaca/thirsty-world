extends Area2D


signal ammoget
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	ammoget.emit()
	$ammopickup.hide()
	pass # Replace with function body.
