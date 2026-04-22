// handles directions
if ((dir == 1) & (sign(spd) != -1)) || ((dir == 0) & (sign(spd) != 1)) {
	spd = -spd
}

// flip on contact
if (place_meeting(x + spd, y, obj_wall)) {
	// flip direction
	if (dir == 0) dir = 1; else dir = 0;
	return
}

x += spd

// damage on touch
if (place_meeting(x, y, obj_player)) {
	damage_player(1, 40);
}