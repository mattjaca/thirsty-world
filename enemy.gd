extends CharacterBody2D

@export var speed = 500

@onready var enemy_2 = $"../Enemy2"
@onready var enemy = $"."

const WALK_SPEED = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # the players movement vector?
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_down"):
		velocity.y +=  1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		#$AnimatedSprite2D.animation = "shoot"
		#$AnimatedSprite2D.play()
	if velocity.length() == 0 && Input.is_action_pressed("shoot") == false:
		$AnimatedSprite2D.animation = "still"
		$AnimatedSprite2D.play()
	if Input.is_action_pressed("shoot"):
		$AnimatedSprite2D.animation = "shoot"
		$AnimatedSprite2D.play()
		

		
		
		
		
		
		
	#else:
		#$AnimatedSprite2D.animation="idle"
	
	position += velocity * delta
#position = position.clamp(Vector2.ZERO, screen_size)
	
	#if velocity.x != 0:
		#$AnimatedSprite2D.animation = "walk"
		#$AnimatedSprite2D.flip_v = false
		#$AnimatedSprite2D.flip_h = velocity.x < 0
	pass
	
	
func _physics_process(delta):
	
	
	if enemy_2:
		var direction =(enemy_2.position - position).normalized()
		velocity = direction * WALK_SPEED
		move_and_slide()
	else:
		$AnimatedSprite2D.animation = "still"
		$AnimatedSprite2D.play()
		
	
		
