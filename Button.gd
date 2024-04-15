extends Node2D



@onready var playNode = $CanvasLayer/Control/TextureRect/Start
@onready var playAnim = $CanvasLayer/AnimationPlayer
@onready var Quit = $CanvasLayer/Control/TextureRect/Quit
# Called when the node enters the scene tree for the first time.
func _ready():
	Quit.connect("button_down", get_tree().quit)
	playNode.connect("button_down", func(): 
		playAnim.play("revolvercylinder")
		#get_tree().quit()
	) ## Object.function(signalName, callable)




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta:float) -> void:
	pass
