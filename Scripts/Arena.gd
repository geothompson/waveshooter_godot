extends Node2D
var played = false
var shot = false

func _ready():
	Global.node_creation_parent = self
	
func _exit_tree():
	Global.node_creation_parent =null

var look_once = false


func _process(_delta: float) -> void:
		if not look_once:
			$ship.look_at(get_global_mouse_position())
			$enemy_ship.look_at($ship.get_global_position())
			look_once = true
	
		$enemy_ship.look_at($ship.get_global_position())
		$ship.look_at(get_global_mouse_position())
		$ship.rotation_degrees += 90
		$enemy_ship.rotation_degrees += -90
		if shot:
			shot = false
		
			$Timer.start()
			$screen_shake.current = true
			print("start")
		
#	$ship.look_at(get_global_mouse_position())
#	pass






func _on_Timer_timeout() -> void:
	$screen_shake.current =false
	print("end")
