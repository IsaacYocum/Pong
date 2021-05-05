extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 200
var velocity = Vector2(1, 0)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision = move_and_collide(velocity.normalized() * speed * delta)
	if collision:
		print("I collided with ", collision.collider.name)
		velocity = Vector2(-velocity.x, velocity.y)
	pass
