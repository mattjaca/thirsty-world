extends Node2D

@onready var punch = $punchbutton
@onready var anim=$punchbutton/AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	#punch.connect("button_down", func():
		#anim.play("Fist_Still")
		#)
	
		
		
	
	pass # Replace with function body.

#Input.is_action_just_pressed("PLY_FUCK_EM_UP")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("PLY_FUCK_EM_UP"):
		anim.play("Fist_Still")
	pass
