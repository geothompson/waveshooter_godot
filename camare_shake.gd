extends Camera2D
export (OpenSimplexNoise) var noise
export (float, 0 , 1) var trauma = 0
var time = 0
export var 	MAX_X = 150
export var 	MAX_Y = 150
export var 	MAX_Z = 25
export var time_scale = 250


func _process(delta: float) -> void:
	time += delta
	
	var shake = pow(trauma, 2)
	offset.x =noise.get_noise_3d(time*50, 0, 0)*MAX_X*shake
	offset.y =noise.get_noise_3d(0, time*50,  0)*MAX_Y*shake
	rotation =noise.get_noise_3d(0, 0,time*50)*MAX_Z*shake

#	offset.y =noise.get_noise_3d(time)
