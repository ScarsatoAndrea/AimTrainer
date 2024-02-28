extends Node2D
var speed = 10
var x
var y
var random = RandomNumberGenerator.new()
@onready var element = load("res://Items/sprite_2d.gd")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	x = random.randi() % 100
	y = random.randi() % 100
	var figa = element.instantiate()
	figa.x = x
	figa.y = y
	add_child(figa)
	print (x)


func _on_circle_died():
	print("morto")
	$Circle.queue_free()
