extends Sprite

export var speed= 75

var velocity = Vector2()

func _process(delta: float) -> void:
	if Global.player != null:
		velocity = global_position.direction_to(Global.player.global_position)
#	look_at(Global.player.get_global_position())
	global_position += velocity * speed *delta
	

func _on_Area2D_area_entered(_area: Area2D) -> void:
	pass # Replace with function body.
