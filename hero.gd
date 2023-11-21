extends CharacterBody3D

@export var speed = 10.0
@export var tilt_speed = .10
@export var tilt_accel = +60
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_input(delta):
	var vy = velocity.y
	velocity = Vector3.ZERO
	var move = Input.get_axis("left", "right")
#	var move = Input.get_axis('back', 'forward')
#	var tilt = Input.get_axis("left_tilt", "right_tilt")
	velocity += -transform.basis.z * move * speed
#	velocity += -transform.basis.x * move * speed
	var new_rotate_x = rotation.x - tilt_speed * move * delta
	if move != 0:
		if new_rotate_x < deg_to_rad(+7) and new_rotate_x > deg_to_rad(-7):
			rotate_x(-tilt_speed * move * delta - move * (tilt_accel * delta * delta) / 2)
	else:
		if rad_to_deg(abs(rotation.x)) > 1:
			rotate_x(-sign(rotation.x) * delta)
	velocity.y = vy

func _physics_process(delta):
	velocity.y -= gravity * delta
	get_input(delta)
	move_and_slide()
	
#	var pos = get_viewport().get_mouse_position()
#	var move = Input.get_axis("back", "forward")
#	print(move)
#	if Input.is_key_pressed(KEY_A):
#		velocity.z = 1000
#	if Input.is_key_pressed(KEY_D):
#		velocity.z = -1000
		
#	if Input.is_key_pressed(KEY_Q) or Input.is_key_pressed(KEY_E):
#		if Input.is_key_pressed(KEY_Q):
#			rotation.x = deg_to_rad(+15)
#		else:
#			rotation.x = deg_to_rad(-15)
#	else:
#		rotation.x = deg_to_rad(0)

#	velocity.y -= gravity * delta
#	move_and_collide(velocity * delta)
