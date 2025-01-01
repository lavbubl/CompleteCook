
//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform bool h;

void main()
{
	vec2 distort;
	if (h)
	{
		distort.x = sin(v_vTexcoord.y * 67853.0) / 2000.0;
	}
	else
	{
		distort.y = sin(v_vTexcoord.x * 67853.0) / 2000.0;
	}
	
	vec4 tex = texture2D( gm_BaseTexture, v_vTexcoord + distort);
	tex.a = tex.a / 1.5;
    gl_FragColor = v_vColour * tex;
}
