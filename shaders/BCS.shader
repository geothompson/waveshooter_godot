shader_type canvas_item;

float dfline(vec2 start,vec2 end, vec2 uv){
	start= vec2(start.x/0.6,start.y);
	end =vec2(end.x/0.6, end.y);
	vec2 line = end - start;
	float frac = dot(uv - start, line) / dot(line, line);
	return distance(start + line * clamp(frac, 0.0, 1.0), uv);
	
}
float dfArc(vec2 origin, float start, float sweep, float radius,vec2 uv){
	
	uv -= vec2(origin.x/0.6, origin.y);
	uv *= mat2(vec2(cos(start), sin(start)), vec2(-sin(start), cos(start)));
	float offs = (sweep / 2.0-3.14);
	float ang = mod(atan(uv.y / abs(uv.x)) - offs, 6.28) + offs;
	ang = clamp(ang, min(0.0, sweep), max(0.0, sweep));
	return distance(radius * vec2(cos(ang), sin(ang)), uv);
	}
float gold(vec2 uv,float infinity){
	
	float dist = infinity;
	
	dist = min(dist, dfline(vec2(0.371, 0.128), vec2(0.259,0.338), uv));
	dist = min(dist, dfline(vec2(0.259, 0.338), vec2(0.308,0.43), uv));
	dist = min(dist, dfline(vec2(0.308, 0.43), vec2(0.37,0.335), uv));
	dist = min(dist, dfline(vec2(0.37, 0.335), vec2(0.616,0.744), uv));
	dist = min(dist, dfline(vec2(0.371, 0.128), vec2(0.466,0.152), uv));
	dist = min(dist, dfline(vec2(0.466, 0.152), vec2(0.401,0.274), uv));
	dist = min(dist, dfline(vec2(0.401, 0.274), vec2(0.656,0.682), uv));
	dist = min(dist, dfline(vec2(0.661, 0.827), vec2(0.69,0.884), uv));
	dist = min(dist, dfline(vec2(0.69, 0.884), vec2(0.731,0.815), uv));
	dist = min(dist, dfline(vec2(0.69, 0.884), vec2(0.703,0.758), uv));
	
	dist = min(dist, dfline(vec2(0.356, 0.721), vec2(0.292,0.82), uv));
	dist = min(dist, dfline(vec2(0.292, 0.82), vec2(0.329,0.885), uv));
	dist = min(dist, dfline(vec2(0.329, 0.885), vec2(0.376,0.816), uv));
	dist = min(dist, dfArc(vec2(0.497, 0.475), 0.0, 1.0, 0.34,uv));
	dist = min(dist, dfArc(vec2(0.497, 0.475), 1.0, 1.33, 0.34,uv));
	dist = min(dist, dfArc(vec2(0.497, 0.475), 0.0, 1.0, 0.34,uv));
	dist = min(dist, dfArc(vec2(0.497, 0.475), 0.0, 1.0, 0.34,uv));
	dist = min(dist, dfArc(vec2(0.497, 0.475), 5.0, 1.4, 0.34,uv));
	dist = min(dist, dfArc(vec2(0.52, 0.52), 0.0, 1.0, 0.38,uv));
	dist = min(dist, dfArc(vec2(0.52, 0.52), 0.0, 1.0, 0.38,uv));
	dist = min(dist, dfArc(vec2(0.52, 0.52), 4.86, 1.5, 0.38,uv));
	
	dist = min(dist, dfline(vec2(0.26, 0.073), vec2(0.250,0.116), uv));
	dist = min(dist, dfline(vec2(0.25, 0.116), vec2(0.228,0.116), uv));
	dist = min(dist, dfline(vec2(0.228, 0.116), vec2(0.244,0.147), uv));
	dist = min(dist, dfline(vec2(0.244, 0.147), vec2(0.237,0.19), uv));
	dist = min(dist, dfline(vec2(0.237, 0.19), vec2(0.261,0.165), uv));
	dist = min(dist, dfline(vec2(0.261, 0.165), vec2(0.284,0.191), uv));
	dist = min(dist, dfline(vec2(0.284, 0.191), vec2(0.278,0.145), uv));
	dist = min(dist, dfline(vec2(0.278, 0.145), vec2(0.298,0.115), uv));
	dist = min(dist, dfline(vec2(0.298, 0.115), vec2(0.271,0.115), uv));
	dist = min(dist, dfline(vec2(0.271, 0.115), vec2(0.26,0.073), uv));
	return dist;
	
}
	
	
 void fragment(){
vec2 uv = vec2(UV.x/0.6,UV.y);
float brightness = 0.004; float thickness = 0.002;
float dist =0.0; float shade=0.0;
float bright = brightness * min(1.0, 1.0-sin(max(1e-3, abs(sin(121.0*TIME)))*150.0));
dist =gold(uv,1e6);
shade = bright / max(1e6,dist - thickness);
COLOR = vec4((vec3(0.80, 9.2,0.05)*shade),1.0);

}
//fun
//float brightness = 0.004; float thickness = 0.002;
//float dist =0.0; float shade=0.0;
//float bright = brightness = min(1.0, 1.0-sin(max(1e-3, abs(sin(121.0-*TIME))*150));
//dist =gold(uv,1e6);
//shade = bright / max(1e6,dist - thickness);
//COLOR = vec4(vec3(0.80, 9.2,0.05)*shade),1.0);

//uniform float brightness = 0.8;
//uniform float contrast = 1.5;
//uniform float saturation = 1.8;
//
//void fragment() {
//	vec3 c = textureLod(SCREEN_TEXTURE, SCREEN_UV, 0.0).rgb;
//
//	c.rgb = mix(vec3(0.1), c.rgb, brightness);
//	c.rgb = mix(vec3(0.5), c.rgb, contrast);
//	c.rgb = mix(vec3(dot(vec3(1.0), c.rgb) * TIME), c.rgb, saturation);
//
//	COLOR.rgb = c*TIME;
//}
