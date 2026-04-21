if (shooting_upward) {x_offset = 0; y_offset = 15;} else {x_offset = 9; y_offset = 7;}

var _beam = instance_create_layer(x + (x_offset * image_xscale), y - y_offset, "Projectiles", obj_beam)

audio_play_sound(snd_player_fire, 0, false);

// handles sprite vars
is_shooting = true;
since_last_shot = 0;

// handles beam direction
if (shooting_upward) {
	_beam.direction = 90;
} else if (sign(image_xscale) == -1) {
	_beam.direction = 180;
}