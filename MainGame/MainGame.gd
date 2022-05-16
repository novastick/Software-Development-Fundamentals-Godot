extends Control

export(int) var countdownmax
var currentTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	currentTimer = countdownmax
	$HUD/Countdown.text = str(currentTimer)
	for button in $HUD/buttons.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])
	while currentTimer > 0:
		yield(get_tree().create_timer(1.0), "timeout")
		$HUD/Countdown.text = str(currentTimer)
		currentTimer = currentTimer - 1
		print(currentTimer)
	print("gameover")
	GlobalVariables.currentscore.push_front (GlobalVariables.scoringinformation["currentScore"])
	print (GlobalVariables.currentscore)
	get_tree().change_scene("res://lose scene/you lost.tscn")
	
	
	
	


func _on_Button_pressed(scene_to_load):
	print("Changing Scene...")
	print(scene_to_load)
	get_tree().change_scene(scene_to_load)
