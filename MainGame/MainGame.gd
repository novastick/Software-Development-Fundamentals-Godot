extends Control

export(int) var countdownmax
var currentTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	currentTimer = countdownmax
	$HUD/Countdown.text = str(currentTimer)
	
	
	while currentTimer > 0:
		yield(get_tree().create_timer(1.0), "timeout")
		$HUD/Countdown.text = str(currentTimer)
		currentTimer = currentTimer - 1
		print(currentTimer)
	print("gameover")
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
