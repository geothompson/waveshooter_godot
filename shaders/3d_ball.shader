shader_type canvas_item;

uniform float intensity = 0.5f;
uniform float layers = 5f;
uniform float speed = 4f;
//I-0.306 L-21.3 S= -6 o=9 peri=178 pers = 1 lac= 2.4
float gradient(vec2 uv) {
//	return(0.5f - distance(vec2(0f, uv.y), vec2(0f, 0.5f))); //sqaure middle
	return(0.5f- distance(vec2(uv.x, uv.y), vec2(0.5f,0.5f)));
	 
}

vec4 colorize(float c, float a){
	vec4 pallete;
	pallete= vec4(c,c,c, a);
	

//
//	pallete.r = max(c,3);
//	pallete.b = float(a>0.3f && c>0.5f);
//	pallete.g = float(c>=0.6f && c<0.5f);

	
	return pallete;
	}
	
void fragment(){
	vec4 bg = texture(TEXTURE, UV - TIME/ speed);
	COLOR = bg;
	COLOR.r = gradient(UV);
	COLOR.r = clamp(COLOR.r * bg.r * intensity* 10f, 0f, 1f);
	COLOR.r = floor(COLOR.r*layers) / layers;
	COLOR.a = float(COLOR.r > 0f);
	COLOR = colorize(COLOR.r, COLOR.a);	
}


	
