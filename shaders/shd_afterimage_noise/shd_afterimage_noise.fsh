//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float pixel_x;
uniform float pixel_y;
uniform sampler2D color_source;

void main()
{
	vec4 color = texture2D(gm_BaseTexture, v_vTexcoord);
	vec4 target_color = texture2D(color_source, vec2(pixel_x, pixel_y));
	gl_FragColor.rgb = target_color.rgb;
	gl_FragColor.a = v_vColour.a * color.a;
}
