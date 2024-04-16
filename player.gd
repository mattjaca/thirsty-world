extends Area2D

signal hit

@export var speed = 100 # how fast the player moves pixel/sec
var screen_size #size of game window

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # the players movement vector?
	if Input.is_action_pressed("move_right"):
		velocity.x +=1
	if Input.is_action_pressed("move_down"):
		velocity.y +=1
	if Input.is_action_pressed("move_left"):
		velocity.x -=1
	if Input.is_action_pressed("move_up"):
		velocity.y -=1
	if velocity.length() > 0:
		velocity=velocity.normalized() * speed
		$AnimatedSprite2D.animation="walk"
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.animation="idle"
	
	position += velocity * delta
#position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation="walk"
		$AnimatedSprite2D.flip_v=false
		$AnimatedSprite2D.flip_h=velocity.x<0

	
	
	pass

#this needs implementation with overworld encounters
#func _on_body_entered(body):
#	hide()
#	hit.emit()
#	$CollisionShape2D.set_deferred("disabled", true)
#	pass # Replace with function body.
	
func start(pos):
	position=pos
	show()
	$CollisionShape2D.disabled=false
