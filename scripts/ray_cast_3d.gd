extends RayCast3D

var current_collider

func _ready():
	pass

func _process(delta):
	var collider = get_collider()

	if is_colliding() and collider is Interactable:
		if Input.is_action_just_pressed("interact"):
			collider.interact()
			
	if is_colliding() and collider.is_in_group("pick"):
		if Input.is_action_just_pressed("interact"):
				pickup_object(collider)
				
	if is_holding and held_object:
		held_object.global_position = hand.global_position
		held_object.global_rotation = hand.global_rotation
			
func pickup_object(obj):
	held_object = obj
	is_holding = true
	obj.global_position = hand.global_position
	obj.global_rotation = hand.global_rotation
	obj.reparent(hand)  #
	obj.collision_layer = 2
	obj.linear_velocity = Vector3.ZERO

@onready var hand: Node3D = $"../../Hand"
var held_object = null
var is_holding = false
