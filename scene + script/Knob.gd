extends Node2D

signal turnedKnob(total_value)

var following := false
var total_value : int = 0
var last_angle : float = 0.0
var accumulated_rotation : float = 0.0

const MAX_DIST_SQ := 10000.0
const SMOOTHING := 0.2

func _physics_process(_delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	var mouse_dist_sq = mouse_pos.distance_squared_to($knob.global_position)
	
	if mouse_dist_sq < MAX_DIST_SQ and Input.is_action_just_pressed("click"):
		following = true
		# Reset last_angle when we start so it doesn't "jump"
		last_angle = $knob.rotation 
	
	if Input.is_action_just_released("click"):
		following = false

	if following:
		var target_ang = (mouse_pos - $knob.global_position).angle() + PI/2
		$knob.rotation = lerp_angle($knob.rotation, target_ang, SMOOTHING)
		
		# --- Revolution Logic ---
		# Calculate how much the knob moved since the last frame
		var diff = angle_difference(last_angle, $knob.rotation)
		accumulated_rotation += diff
		
		# If accumulated movement is > 360 degrees (2*PI)
		if abs(accumulated_rotation) >= TAU: # TAU is 2*PI
			var revolutions = int(accumulated_rotation / TAU)
			total_value += revolutions
			
			# Keep the remainder so we don't lose progress toward the next turn
			accumulated_rotation = fmod(accumulated_rotation, TAU)
			
			turnedKnob.emit(total_value)
			print("Total Revolutions: ", total_value)
			
		last_angle = $knob.rotation
