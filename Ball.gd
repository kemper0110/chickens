extends CharacterBody3D

class_name Ball


var initial_ball_speed = 4.0
var speed = initial_ball_speed
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	velocity.x = [-1, 1][randi() % 2] * initial_ball_speed
	velocity.z = [-0.4, 0.4][randi() % 2] * initial_ball_speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision_info = move_and_collide(velocity * speed * delta) 
	rotate_x(velocity.z * delta * 1.3)
	rotate_z(-velocity.x * delta * 1.3)
	if collision_info:
		var normal = collision_info.get_normal()
		var bounce = velocity.bounce(normal)
		print(normal, bounce)
		velocity = bounce * Vector3(1.0, 0.0, 1.0)
		print(collision_info.get_collider().name)
