extends Sprite
var shoot = false
var can_shoot = true
var speed = 150
var velocity = Vector2()


var bullet = preload("res://Bullet.tscn")

func _ready() -> void:
 Global.player = self

func _exit_tree() -> void:
	Global.player = null


func _process(delta: float) -> void:
	velocity.x =int(Input.is_action_pressed("move_right"))-int(Input.is_action_pressed("move_left"))
	velocity.y =int(Input.is_action_pressed("move_down"))-int(Input.is_action_pressed("move_up"))
	velocity = velocity.normalized()
	global_position +=  velocity * delta * speed
	


	if Input.is_action_pressed("click") and Global.node_creation_parent != null and can_shoot:
		if not $ship_sneeze.is_playing():
			$ship_sneeze.play("ripple")
			$anim_timer.start()
#		Global.instance_node(bullet, $gun_pos.global_position, Global.node_creation_parent)
#		$reload_speed.start()
#		can_shoot = false
		
#	if not $AnimationPlayer.is_playing() and shoot:
#		Global.instance_node(bullet, $gun_pos.global_position, Global.node_creation_parent)
#		$AudioStreamPlayer2D.play()
#		shoot = false


func _on_Timer_timeout() -> void:
	can_shoot= true


#func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
#	Global.instance_node(bullet, $gun_pos.global_position, Global.node_creation_parent)
#	$AudioStreamPlayer2D.play()
#	$reload_speed.start()
#	can_shoot = false
	


func _on_anim_timer_timeout() -> void:
	
	Global.instance_node(bullet, $gun_pos.global_position, Global.node_creation_parent)
	$AudioStreamPlayer2D.play()
	$reload_speed.start()
	can_shoot = false
