//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 tex = texture2D( gm_BaseTexture, v_vTexcoord );
	tex.rgb += vec3(1.0, 1.0, 1.0);
    gl_FragColor = tex;
}
