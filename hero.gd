extends CharacterBody3D

@export var speed = 10.0
@export var tilt_speed = .10
@export var tilt_accel = +60
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var anim_player: AnimationPlayer = $fox/AnimationPlayer

var step_period = 0.
var base_y
var defencing = false

func _ready():
	base_y = position.y

func _process(delta):
	pass

func get_input(delta):
	var vy = velocity.y
	velocity = Vector3.ZERO
	var move = Input.get_axis("left", "right")
	var defencing_updated = false
	if Input.is_action_pressed("attack"):
		if defencing == false:
			defencing = true
			defencing_updated = true
	else:
		if defencing == true:
			defencing = false
			defencing_updated = true
	if defencing_updated:
		if defencing:
			anim_player.play('StartDefence')
		else:
			anim_player.play('StopDefence')
	velocity += -transform.basis.z * move * speed
	var new_rotate = rotation.z - tilt_speed * move * delta + move * (tilt_accel * delta * delta) / 2
	if move != 0:
		step_period += delta
	else:
		step_period = 0
	position.y = base_y + 0.1 * sin(15 * step_period) * abs(move)
	rotation.x = -deg_to_rad(1.5 * sin(15 * step_period) * abs(move))
#	print(position.y)
	if move != 0:
		if new_rotate < deg_to_rad(+5) and new_rotate > deg_to_rad(-5):
			rotate_z(tilt_speed * move * delta + move * (tilt_accel * delta * delta) / 2)
	else:
		if rad_to_deg(abs(rotation.z)) > 1:
			rotate_z(-sign(rotation.z) * delta)
#		if rad_to_deg(abs(rotation.y)) > 1:
#			rotate_y(-sign(rotation.y) * delta)
	velocity.y = vy

func _physics_process(delta):
#	velocity.y -= gravity * delta
	get_input(delta)
	move_and_slide()
