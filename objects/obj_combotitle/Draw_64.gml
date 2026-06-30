title_index += 0.35
if (title_index >= 2)
    title_index = frac(title_index)

image_index = title * 2 + title_index
if image_index > sprite_get_number(spr_combotitles)
{
    image_index -= sprite_get_number(spr_combotitles)
    very = true
}
for (var i = 0; i < array_length(afterimages); i++)
{
    var b = afterimages[i]
    draw_sprite_ext(b[2], b[3], b[0], b[1], image_xscale, image_yscale, image_angle, image_blend, b[4])
    afterimages[i][4] -= 0.15
}

draw_sprite(sprite_index, image_index, x, y)

if very
    draw_sprite(spr_combovery, 0, x - 65, y - 6)
