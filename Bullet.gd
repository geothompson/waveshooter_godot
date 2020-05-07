extends Sprite

var velocity = Vector2(1,0)

export var speed = 250

var look_once = true

func _process(delta: float) -> void:
	if look_once:
		look_at(get_global_mouse_position())
		look_once= false
	global_position += velocity.rotated(rotation) * speed * delta


func _on_VisibilityNotifier2D_screen_exited() -> void:
		 $bullet_delete_timer.start()


func _on_Timer_timeout() -> void:
	queue_free()
