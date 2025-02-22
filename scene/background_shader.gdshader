shader_type canvas_item;
render_mode unshaded;

uniform sampler2D displace: hint_screen_texture;
uniform sampler2D SCREEN_TEXTURE : filter_nearest;
uniform float dispAmt: hint_range(0,0.1);
uniform float aberrationAmt: hint_range(0,0.1);

void fragment() {
	vec4 disp = texture(displace, SCREEN_UV);
	vec2 newUV = SCREEN_UV * disp.xy * dispAmt;
	COLOR = textureLod(SCREEN_TEXTURE, newUV, 1);
	}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
