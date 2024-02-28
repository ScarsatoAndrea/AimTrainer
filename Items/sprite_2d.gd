extends Sprite2D
var life_time = 1
signal died

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.scale += Vector2(life_time, life_time) * delta
	print (life_time , " " , self.scale)
	if (self.scale.x >= 3):
		life_time = -(life_time)
	if (self.scale.x <= 0):
		died.emit()
