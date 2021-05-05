extends KinematicBody2D

var KEY_MV_UP
var KEY_MV_DWN

var speed = 100
var velocity = Vector2(0, 0)

func set_movement_keys(key_move_up, key_move_down):
	KEY_MV_UP = key_move_up
	KEY_MV_DWN = key_move_down
	pass

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed(KEY_MV_UP):
		velocity.y = -1
	if Input.is_action_pressed(KEY_MV_DWN):
		velocity.y = 1
	velocity = velocity * speed 
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
