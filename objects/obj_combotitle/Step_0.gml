title_index += 0.35
if (title_index >= 2)
    title_index = frac(title_index)

image_index = title * 2 + title_index
if image_index > sprite_get_number(spr_combotitles)
{
    image_index -= sprite_get_number(spr_combotitles)
    very = true
}
