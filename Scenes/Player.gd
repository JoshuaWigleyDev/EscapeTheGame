extends CharacterBody2D


var SPEED = 150
const JUMP_VELOCITY = -400.0
var DIRECTION = 1
@onready var player_movement = $PlayerMovement

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

		
	velocity = input_direction * SPEED

func _physics_process(delta):
	SPEED = 150
	# Get the left and right axis
	var direction = Input.get_axis("move_left", "move_right")
	
	# Change the direction view of the player when they're moving left/right
	# So that it doesn't look like they're walking backwards one direction
	if direction >0:
		player_movement.flip_h = false
	elif direction < 0:
		player_movement.flip_h = true
	
	if direction==0:
		player_movement.play("idle")
	elif direction != 0 && Input.is_key_pressed(KEY_SHIFT):
		SPEED = SPEED * 2.5
		player_movement.play("running")	
	elif direction != 0:
		player_movement.play("walking")
		
	get_input()
	move_and_slide()
