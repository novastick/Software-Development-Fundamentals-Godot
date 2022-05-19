extends KinematicBody2D

var movement_speed = 500
var bulletSource = preload ("res://Bullet/Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	set_physics_process(true)




func _physics_process(delta):
	if Input.is_action_pressed("ui_left"): 
		if position.x > 10:
			move_and_collide(Vector2(-movement_speed * delta, 0))
	if Input.is_action_pressed("ui_right"):
		if position.x < 1250:
			move_and_collide(Vector2(movement_speed * delta, 0))


func _process(delta):
	if Input.is_action_just_pressed("fire"):
		var bulletInstance = bulletSource.instance()
		bulletInstance.position = Vector2(position.x+25, position.y-20)
		get_tree().get_root().add_child(bulletInstance)

