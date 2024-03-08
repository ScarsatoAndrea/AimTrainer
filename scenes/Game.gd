extends Node2D
var speed = 1
var x
var y
var random = RandomNumberGenerator.new()
var lives = 3
var time : int = 1;
var trashold = 10;
var points = 0;
var can_start : bool = true
@onready var element = preload("res://Items/circle.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	set_timer(speed)
	$SignalManager.connect("died", Callable(self, "on_circle_died"))
	$SignalManager.connect("hit", Callable(self, "on_circle_hit"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if time >= trashold and speed > 0.3:
		speed -= 0.2
		set_timer(speed)
		time += 1
		trashold += 7

func set_timer(new_time):
	print("parito")
	$Timer.autostart = true
	$Timer.wait_time = new_time
	$Timer.start()


func on_circle_died():
	lives -= 1
	if lives == 0:
		$Node.queue_free()
		can_start = false
		$Timer.stop()
	print("morto")


func _on_timer_timeout():
	var pre_x = 0
	var pre_y = 0
	if can_start:
		print("nato")
		time += round($Timer.wait_time)
		x = (random.randi() % 818) + 167
		y = (random.randi() % 314) + 167
		x = x if x <= pre_x + 30 and x >= pre_x - 10  else x + 25
		y = y if y <= pre_y + 30 and  y >= pre_y - 10 else y + 25
		pre_x = x
		pre_y = y
		var figa = element.instantiate()
		figa.position = Vector2(x, y)
		$Node.add_child(figa)


func on_circle_hit():
	print("ok")
	points += 10# Replace with function body.
