extends Area3D
@export var move_speed:float = 2.0
@export var move_direction: Vector3

var start_pos:Vector3
var target_pos: Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	start_pos = global_position
	target_pos = start_pos + move_direction


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = global_position.move_toward(target_pos,delta*move_speed)
	if global_position == target_pos:
		target_pos = start_pos
	if global_position == start_pos:
		target_pos = start_pos + move_direction


func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.game_over()
