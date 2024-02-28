extends Node2D
var speed = 1
var x
var y
var random = RandomNumberGenerator.new()
var lives = 3
var time : int = 1;
var trashold = 10;
@onready var element = load("res://Items/circle.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	set_timer(speed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if time >= trashold and speed > 0:
		speed -= 0.3
		set_timer(speed)
		time += 1
		trashold += 15
	print (time)

func set_timer(new_time):
	print("parito")
	$Timer.autostart = true
	$Timer.wait_time = new_time
	$Timer.start()


func _on_circle_died():
	print("morto")
	$Circle.queue_free()


func _on_timer_timeout():
	print("nato")
	time += round($Timer.wait_time)
	x = (random.randi() % 818) + 167
	y = (random.randi() % 314) + 167
	var figa = element.instantiate()
	figa.position = Vector2(x, y)
	add_child(figa)
	print (x) # Replace with function body.
