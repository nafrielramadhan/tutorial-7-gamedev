extends CharacterBody3D

@export var speed: float = 10.0
@export var sprint_speed: float = 20.0
@export var crouch_speed: float = 5.0
@export var acceleration: float = 5.0
@export var gravity: float = 9.8
@export var jump_power: float = 5.0
@export var mouse_sensitivity: float = 0.3

@export var crouch_height: float = -0.5        
@export var normal_height: float = 0.0          
@export var crouch_lerp_speed: float = 8.0      

@onready var head: Node3D = $Head
@onready var camera: Camera3D = $Head/Camera3D
@onready var ray: RayCast3D = $Head/Camera3D/RayCast3D

var camera_x_rotation: float = 0.0
   
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		head.rotate_y(deg_to_rad(-event.relative.x * mouse_sensitivity))

		var x_delta = event.relative.y * mouse_sensitivity
		camera_x_rotation = clamp(camera_x_rotation + x_delta, -90.0, 90.0)
		camera.rotation_degrees.x = -camera_x_rotation

func _physics_process(delta):
	var movement_vector = Vector3.ZERO

	if Input.is_action_pressed("movement_forward"):
		movement_vector -= head.basis.z
	if Input.is_action_pressed("movement_backward"):
		movement_vector += head.basis.z
	if Input.is_action_pressed("movement_left"):
		movement_vector -= head.basis.x
	if Input.is_action_pressed("movement_right"):
		movement_vector += head.basis.x

	movement_vector = movement_vector.normalized()

	var target_speed = speed

	if Input.is_action_pressed("sprint"):
		target_speed = sprint_speed
	elif Input.is_action_pressed("crouch"):
		target_speed = crouch_speed

	var target_y = normal_height
	if Input.is_action_pressed("crouch"):
		target_y = crouch_height

	head.position.y = lerp(head.position.y, target_y, crouch_lerp_speed * delta)

	velocity.x = lerp(velocity.x, movement_vector.x * target_speed, acceleration * delta)
	velocity.z = lerp(velocity.z, movement_vector.z * target_speed, acceleration * delta)

	# Gravity
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_power

	move_and_slide()
