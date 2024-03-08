extends Node2D
var random = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	hideee()

	$Timer.wait_time = random.randi()%10
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func hideee():
	$E.set_visible(false)
	$R.set_visible(false)
	$W.set_visible(false)
	$Q.set_visible(false)

func _on_timer_timeout():
	var i = random.randi()%4
	if i == 0:
		$E.set_visible(true)
		$Timer2.start()
	if i == 1:
		$R.set_visible(true)
		$Timer2.start()
	if i == 2:
		$W.set_visible(true)
		$Timer2.start()
	if i == 3:
		$Q.set_visible(true)
		$Timer2.start()

func _on_timer_2_timeout():
	hideee()
	$Timer.start()
