extends Sprite

export var speed= 75

var velocity = Vector2()

func _process(delta: float) -> void:
	if Global.player != null:
		velocity = global_position.direction_to(Global.player.global_position)
#	look_at(Global.player.get_global_position())
	global_position += velocity * speed *delta
