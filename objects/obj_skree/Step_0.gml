if instance_exists(obj_player) {
	if (!falling) & (abs(obj_player.x - x) < 5) & (obj_player.y > y) {
		falling = true;
	}

	if (falling) {
		image_speed = 2;
		x = (obj_player.x);
		y += spd;
	}

	// damage on touch
	if (place_meeting(x, y, obj_player)) {
		damage_player(1, 40);
		instance_destroy();
	}
	
	// destroy if hits wall
	if (place_meeting(x, y, obj_wall)) {
		instance_destroy();
	}
}