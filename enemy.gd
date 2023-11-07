extends CharacterBody3D


var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	velocity.y -= gravity * delta
	move_and_collide(velocity * delta)
