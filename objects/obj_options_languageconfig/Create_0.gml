event_inherited()

depth = -3000

mid_x = SCREEN_WIDTH / 2
mid_y = SCREEN_HEIGHT / 2

left_arrow_xstart = mid_x - 180
left_arrow_x = left_arrow_xstart

right_arrow_xstart = mid_x + 180
right_arrow_x = right_arrow_xstart

selected = global.language

// Make sure this array matches the indexes from the languages enum seen in the script lang_util.

languages_array = [
	[languages.english, "ENGLISH"],
	[languages.latam_spanish, "ESPAÑOL LATINO"]
]

loading = false
