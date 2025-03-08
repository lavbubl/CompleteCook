//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 tex = texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor = vec4(tex.r - 0.5, 0, 0, 1);
}
