extends Sprite
var played = false
var look_once = true
func _ready() -> void:
	visible = false

func _process(delta: float) -> void:
#	if look_once:
#		look_at(get_global_mouse_position())
#		look_once= false
#	if Input.is_action_just_pressed("click"):
#		visible = true
#		$AnimationPlayer.play("muzzle_flash")
#		played = true
#
#	if not $AnimationPlayer.is_playing():
#		if played:
#			queue_free()
	pass
