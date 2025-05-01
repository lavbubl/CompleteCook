#define Transparent vec4(0, 0, 0, 0)
#define Tolerance 0.005
//If you feel like your colors should be matching but aren't, increase this number a bit.

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D palTexture;
uniform float texel_h;
uniform vec4 pal_uvs;

vec4 colcheck(vec4 inCol)
{
    if (inCol.a < Tolerance) 
		return Transparent;
    
    float dist;
	vec2 testPos;
	vec4 leftCol;
	
    for (float _y = pal_uvs.y; _y <= pal_uvs.w; _y += texel_h)
    {
		testPos = vec2(pal_uvs.x, _y);
		leftCol = texture2D(palTexture, testPos);
		
		if (distance(leftCol, inCol) < Tolerance)
			return vec4(1, 1, 1, inCol.a);
    }
	
    return Transparent;
}

void main()
{
	vec4 col = texture2D( gm_BaseTexture, v_vTexcoord);
	col = colcheck(col);
	gl_FragColor = v_vColour * col;
}