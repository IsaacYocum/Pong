extends KinematicBody2D

onready var UI = get_node("/root/Game/MarginContainer/VBoxContainer/UI")
onready var board = get_node("/root/Game/MarginContainer/VBoxContainer/Board")

export var speed = 300
var valid_beginning_trajectories = [
	Vector2(-1, 1),  # down left
	Vector2(-1, -1), # up left
	Vector2(1, 1),   # down right
	Vector2(1, -1),  # up right
	Vector2(-.5, .5),
	Vector2(-.5, -.5),
	Vector2(.5, .5),
	Vector2(.5, .5)
]
var velocity

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	velocity = valid_beginning_trajectories[randi() % valid_beginning_trajectories.size()]
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision = move_and_collide(velocity.normalized() * speed * delta)
	if collision:
		print("Ball collided with ", collision.collider.name)
		if collision.collider.name == "leftGoal" || collision.collider.name == "rightGoal":
			if collision.collider.name == "leftGoal":
				print("Player two scores!")
				UI.awardPoints("player2")
				board.spawn_ball()
			if collision.collider.name == "rightGoal":
				print("Player one scores!")
				UI.awardPoints("player1")
				board.spawn_ball()
			queue_free()
		velocity = velocity.bounce(collision.normal)
	pass
