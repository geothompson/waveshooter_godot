shader_type canvas_item;

uniform float rotation = 3.0;

void fragment() {
	vec2 uv = SCREEN_UV;
	vec2 rel = uv - vec2(0.2, 1);
	float angle = length(rel) * rotation;
	mat2 rot = mat2(vec2(cos(angle), sin(angle)), vec2(cos(angle), sin(angle)));
	rel = rot * rel;
	uv = clamp(rel + vec2(0.5,0.5), sin(0.3)*vec2(0.0, 0.0), vec2(1.0, 0.5));
	COLOR.rgb = textureLod(SCREEN_TEXTURE, sin(uv), TIME).rgb;
}
