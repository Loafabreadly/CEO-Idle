extends Node

@onready var currentMoney = 0
@onready var currentMP = 1
@onready var money = $UI/CenterContainer/VBoxContainer/moneyContainer/money
@onready var mp = $UI/CenterContainer/VBoxContainer/mpContainer/mp
@onready var gameTimer = $Timer
@onready var nextLevelCost = 10
@onready var status = $UI/CenterContainer/VBoxContainer/statusLabel
@onready var nextLevelCostLabel = $UI/CenterContainer/VBoxContainer/nlcContainer/nlc
# Called when the node enters the scene tree for the first time.
func _ready():
	startGame()

func startGame():
	currentMoney = 0
	currentMP = 1
	gameTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	money.text = str(currentMoney)
	mp.text = str(currentMP)
	nextLevelCostLabel.text = str(nextLevelCost)

func _on_timer_timeout():
	currentMoney += (currentMP * 1)


func _on_buy_mp_pressed():
	if currentMoney >= nextLevelCost:
		currentMP = currentMP * 2
		currentMoney -= nextLevelCost
		nextLevelCost = nextLevelCost*(nextLevelCost-5)
		status.text = "Purchase successful!"
	else:
		status.text = "You cannot afford the next level!"


func _on_grind_pressed():
	currentMoney += 1
