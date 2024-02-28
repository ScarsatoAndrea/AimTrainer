extends Sprite2D
var speed = 0.5
signal died

# Called when the node enters the scene tree for the first time.
func _ready():
	self.scale = Vector2(0,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.scale += Vector2(speed * delta, speed * delta)
	if (self.scale.x >= 1.2):
		speed = -(speed)
	if (self.scale.x <= 0):
		died.emit()
		self.queue_free()
