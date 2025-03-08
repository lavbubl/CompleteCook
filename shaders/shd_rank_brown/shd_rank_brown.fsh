//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 source = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	vec4 black = vec4(80, 0, 0, 255);
	vec4 brown = vec4(216, 144, 96, 255);
	black = black / vec4(255, 255, 255, 255);
	brown = brown / vec4(255, 255, 255, 255);
	
	vec4 newcol = vec4(0, 0, 0, 0);
	
	if (distance(vec4(source.rgb, 1), vec4(0, 0, 0, 1)) <= 0.004)
		newcol = vec4(black.rgb, source.a);
	else
		newcol = vec4(brown.rgb, source.a);
	
	gl_FragColor = newcol;
}
