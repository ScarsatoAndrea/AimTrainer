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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if time >= trashold and speed > 0:
		speed -= 0.22
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
	if can_start:
		print("nato")
		time += round($Timer.wait_time)
		x = (random.randi() % 818) + 167
		y = (random.randi() % 314) + 167
		var figa = element.instantiate()
		figa.position = Vector2(x, y)
		$Node.add_child(figa)
		$SignalManager.connect("died", Callable(self, "on_circle_died"))
		$SignalManager.connect("hit", Callable(self, "on_circle_hit"))


func on_circle_hit():
	print("ok")
	points += 10# Replace with function body.
