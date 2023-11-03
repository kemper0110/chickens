extends Node3D

@export var speed = 15

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var pos = get_viewport().get_mouse_position()
	# rotation.x - q, e
	# rotation.z = -pos.x / 100 # влево-вправо
	
	if Input.is_key_pressed(KEY_A):
		position.z += speed * delta
	if Input.is_key_pressed(KEY_D):
		position.z -= speed * delta

	if Input.is_key_pressed(KEY_Q) or Input.is_key_pressed(KEY_E):
		if Input.is_key_pressed(KEY_Q):
			rotation.x = deg_to_rad(+15)
		else:
			rotation.x = deg_to_rad(-15)
	else:
		rotation.x = deg_to_rad(0)

