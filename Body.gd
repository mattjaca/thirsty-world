extends CharacterBody3D


const SPEED = 20.0
const JUMP_VELOCITY = 10.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var neck = $Neck
@onready var camera = $Neck/Camera3D
@onready var fist = $Fist
@onready var anim = $Neck/Camera3D/Fist/AnimationPlayer
@onready var punch = $"../Punch"
@onready var wilhelm = $"../Wilhelm"
@onready var finger = $Neck/Camera3D/Finger/AnimationPlayer





func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			rotation.y += -deg_to_rad(event.relative.x * 0.5)
			camera.rotation.x += -deg_to_rad(event.relative.y * 0.5)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-30), deg_to_rad(60))
	

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	if Input.is_action_just_pressed("PLY_FUCK_EM_UP"):
		anim.play("Fight")
		punch.play()
		wilhelm.play()
		
	if Input.is_action_just_pressed("the_bird"):
		finger.play("Taunt")
		
		
		
	

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	elif !is_on_floor():
		velocity.y -= 3
	else:
		velocity.y = 0
	
	if position.y < -200:
		position.y = 0
		velocity = Vector3.ZERO

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = -Input.get_vector("move_right", "move_left", "move_down", "move_up")
	#var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	velocity = velocity.move_toward(Vector3(input_dir.x, 0, input_dir.y).rotated(Vector3.UP, rotation.y) * 15, 60 * delta)
	
	#if direction:
		#velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func getRekt() -> void:
	velocity.y += 200
