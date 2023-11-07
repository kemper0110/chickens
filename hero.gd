extends CharacterBody3D

@export var speed = 15
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var pos = get_viewport().get_mouse_position()
	
	if Input.is_key_pressed(KEY_A):
		velocity.z = 1000
	if Input.is_key_pressed(KEY_D):
		velocity.z = -1000
		
	if Input.is_key_pressed(KEY_Q) or Input.is_key_pressed(KEY_E):
		if Input.is_key_pressed(KEY_Q):
			rotation.x = deg_to_rad(+15)
		else:
			rotation.x = deg_to_rad(-15)
	else:
		rotation.x = deg_to_rad(0)

	velocity.y -= gravity * delta
	move_and_collide(velocity * delta)
