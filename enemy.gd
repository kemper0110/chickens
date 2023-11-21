extends CharacterBody3D

@export var ball: Ball
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
#	velocity.y -= gravity * delta
	var direction = (ball.position - position).normalized()
	velocity.z = direction.z * 3000 * delta
	move_and_slide()
