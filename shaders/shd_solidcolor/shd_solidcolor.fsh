//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float red;
uniform float green;
uniform float blue;

void main()
{
	vec4 color = texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor.rgb = vec3(red, green, blue);
	gl_FragColor.a = v_vColour.a * color.a;
}
