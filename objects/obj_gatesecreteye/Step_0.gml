timer += 20
yoffset = wave(-2, 2, 2, 2, timer)
var _x = x
var _x = x;
x = wave(xstart - disx, xstart + disx, time_x, 10, timer)
y = wave(ystart - disx, ystart + disx, time_y, 10, timer)
y += yoffset

if ((x - _x) < 0)
    depth = 80
else
    depth = 0
