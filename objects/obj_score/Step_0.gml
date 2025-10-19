global.score = max(0, global.score)
shake_mag = max(shake_mag - 0.5, 0)

visible = hud_get_visible()

x = 121 + irandom_range(shake_mag, -shake_mag)
y = 90 + irandom_range(shake_mag, -shake_mag)
