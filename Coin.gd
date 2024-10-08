extends Area3D
@export var score: int = 1 
var spin_speed: float = 2.0
var bob_height: float = 0.2
var bob_speed: float = 5.0

@onready var start_y: float = global_position.y
var t: float = 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(Vector3.UP, spin_speed*delta)
	t += delta
	var d = (sin(t*bob_speed)+1)/2
	print(d)
	global_position.y = start_y + bob_height * d


func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.add_score(score)
		queue_free()
