extends RigidBody2D

onready var spawn_point = global_position

var on_floor = false
var mouse_velocity = Vector2()
var dead = false

var horiz_sensitivity = 1.5
var jump_sensitivity = 10
var fast_fall_sensitivity = 2

const max_side_vel = 1500
const max_up_vel = 1300
const max_down_vel = 2000

const max_move_vel = 50
const max_jump_vel = 150

func _input(event):
	if (
		event is InputEventMouseMotion and
		Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED
	):
		mouse_velocity = event.relative
		
		if not on_floor and mouse_velocity.y < 0:
			mouse_velocity.y = 0
		
		mouse_velocity.x *= horiz_sensitivity
		if mouse_velocity.y < 0:
			mouse_velocity.y *= jump_sensitivity
		else:
			mouse_velocity.y *= fast_fall_sensitivity
		
		mouse_velocity.x = min(max(mouse_velocity.x, -max_move_vel), max_move_vel)
		mouse_velocity.y = max(mouse_velocity.y, -max_jump_vel)

func _physics_process(delta):
	linear_velocity += mouse_velocity
	mouse_velocity = Vector2(0, 0)
	
	linear_velocity.x = min(max(linear_velocity.x, -max_side_vel), max_side_vel)
	linear_velocity.y = min(max(linear_velocity.y, -max_up_vel), max_down_vel)
	
	#get_tree().get_root().find_node("RichTextLabel", true, false).text = str(linear_velocity)

func _integrate_forces(state):
	if dead:
		linear_velocity = Vector2(0, 0)
		state.transform.origin = spawn_point
		dead = false