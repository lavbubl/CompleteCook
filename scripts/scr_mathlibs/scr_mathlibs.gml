function Vector2(argument0, argument1) constructor
{
	x = argument0
	y = argument1
}

function cycle(argument0, argument1, argument2)
{
	var delta = (argument2 - argument1)
	var result = ((argument0 - argument1) % delta)
	if (result < 0)
		result += delta
	return (result + argument1);
}

function angle_rotate(argument0, argument1, argument2)
{
	var diff = cycle((argument1 - argument0), -180, 180)
	if (diff < (-argument2))
		return (argument0 - argument2);
	if (diff > argument2)
		return (argument0 + argument2);
	return argument1;
}

function get_velocity(argument0, argument1)
{
	return (argument0 / argument1);
}

function Wave(argument0, argument1, argument2, argument3)
{
	var a4 = ((argument1 - argument0) * 0.5)
	return ((argument0 + a4) + (sin(((((current_time * 0.001) + (argument2 * argument3)) / argument2) * (2 * pi))) * a4));
}

function distance_to_pos(argument0, argument1, argument2, argument3, argument4, argument5)
{
	return (abs((argument0 - argument2)) <= argument4 && abs((argument1 - argument3)) <= argument5);
}

function distance_between_points(argument0, argument1, argument2, argument3)
{
	return sqrt((sqr((argument2 - argument0)) + sqr((argument3 - argument1))));
}

function calculate_jump_velocity_alt(argument0, argument1, argument2, argument3)
{
	var xx = (argument0 - x)
	var yy = (argument1 - y)
	var g = argument3
	var tmp = (power(argument2, 4) - (g * ((g * power(xx, 2)) + ((2 * yy) * power(argument2, 2)))))
	if (tmp > 0)
	{
		if (xx == 0)
		{
			var a1 = pi / 2
			if (yy < 0)
				var a2 = -pi / 2
			else
				a2 = pi / 2
		}
		else
		{
			a1 = arctan2((power(argument2, 2) + sqrt(tmp)), (g * xx))
			a2 = arctan2((power(argument2, 2) - sqrt(tmp)), (g * xx))
		}
		hsp = ((cos(a1) * argument2) * 1.2)
		vsp = (cos(a2) * argument2)
		if (vsp > 0)
			vsp *= -1
		hsp = (abs(hsp) * sign(xx))
	}
	exit;
}

function calculate_jump_velocity(argument0, argument1, argument2, argument3)
{
	var a = get_projectile_angle(x, y, argument0, argument1, argument2, argument3)
	hsp = lengthdir_x(argument2, a)
	vsp = lengthdir_y(argument2, a)
	exit;
}

function get_projectile_angle(argument0, argument1, argument2, argument3, argument4, argument5)
{
	var xt = floor((argument2 - argument0))
	var yt = (-(floor((argument3 - argument1))))
	var root = (power(argument4, 4) - (argument5 * ((argument5 * sqr(xt)) + ((2 * sqr(argument4)) * yt))))
	var angle = 0
	if (root > 0)
	{
		angle = radtodeg(arctan(((sqr(argument4) + sqrt(root)) / (argument5 * xt))))
		if (xt < 0)
			angle -= 180
	}
	else if (xt > 0)
		angle = 45
	else
		angle = 135
	return angle;
}

