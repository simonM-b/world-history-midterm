shader_type canvas_item;

// Control the sharpness of the fade (0.0 to 1.0+)
uniform float falloff : hint_range(0.0, 8.0) = 1;
// Control the base radius of the circle
uniform float radius : hint_range(0.0, 4.0) = 0.1
;

void fragment() {
	// 1. Calculate distance from center (0.5, 0.5)
	float dist = distance(UV, vec2(0.5));
	
	// 2. Map distance to alpha: center is 1 (opaque), edges are 0 (transparent)
	// We use smoothstep for a softer transition
	float alpha = 0.9 - smoothstep(radius - falloff * 0.1, radius + falloff * 0.5, dist);
	
	// 3. Set color to black and apply calculated alpha
	COLOR = vec4(0.0, 0.0, 0.0, alpha);
}
