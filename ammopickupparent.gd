extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	$Area2D2/CollisionShape2D.disabled=true
	$Area2D2/AudioStreamPlayer2D.play()
	self.hide()
	
	
	pass # Replace with function body.
