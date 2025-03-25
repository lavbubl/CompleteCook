varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 col = texture2D(gm_BaseTexture, v_vTexcoord);
	
	if (floor(mod(v_vTexcoord.y * 540.0, 2.0) * 2.0) == 0.0)
		col.rgb -= 0.4;
	
	//increase blur with intensity!
	gl_FragColor = col;
}
