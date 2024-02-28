extends Sprite2D
var speed = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	self.scale = Vector2(0,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.scale += Vector2(speed * delta, speed * delta)
	if (self.scale.x >= 0.9):
		speed = -(speed)
	if (self.scale.x <= 0):
		$"../../SignalManager".died.emit()
		self.queue_free()

func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_RIGHT:
		if get_rect().has_point(to_local(event.position)):
			$"../../SignalManager".hit.emit()
			self.queue_free()
			print("colpito")
