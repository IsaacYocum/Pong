extends MarginContainer

onready var player1Score = get_node("MarginContainer/VBoxContainer/P1Score")
onready var player2Score = get_node("MarginContainer/VBoxContainer/P2Score")

var player1Points = 0
var player2Points = 0

func _ready():
	player1Points = 0
	player1Score.text = str(0)
	player2Points = 0
	player2Score.text = str(0)
	pass

func _on_ResetGame_button_up():
	print("Reset button pressed!")
	get_tree().reload_current_scene()
	pass # Replace with function body.

func awardPoints(player):
	if player == "player1":
		player1Points += 10
		player1Score.text = str(player1Points)
	if player == "player2":
		player2Points += 10
		player2Score.text = str(player2Points)
	pass
	
