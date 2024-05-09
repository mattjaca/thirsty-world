extends Area2D

var entered = false



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_Area2D_entered(body:Area2D):
	entered = true
	
	
func _on_Area2D_exited(body):
	entered = false

func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://Saloon.tscn")
	
	

	
