#define br 1

//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	float alpha = texture2D( gm_BaseTexture, v_vTexcoord ).a;
    gl_FragColor = vec4(br, br, br, alpha);
}
