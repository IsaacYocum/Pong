extends MarginContainer

onready var ball = preload("res://ball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_ball()
	pass # Replace with function body.

func spawn_ball():
	print("Spawning a ball!")
	var board_size = self.get_rect().size
	
	var new_ball = ball.instance()
	new_ball.set_position(Vector2(board_size.x / 2, board_size.y / 2))
	add_child(new_ball)
	pass
