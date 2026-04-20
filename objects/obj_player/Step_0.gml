var _key_right = keyboard_check(ord("D"));
var _key_left = keyboard_check(ord("A"));
var _key_jump = keyboard_check(vk_space) || keyboard_check(ord("W"));

// movement calc
hsp = (_key_right - _key_left) * walksp;

// gravity
vsp = vsp + grv;

// jump handler
if (can_jump-- > 0) && (_key_jump)
{
	vsp = jumpsp;
	can_jump = 0;
	
	audio_play_sound(snd_player_jump, 0, false)
}

/// COLLISIONS

// x collision
if (place_meeting(x + hsp, y, obj_wall))
{
	// while there is still a significant gap between player and wall
	while (abs(hsp) > 0.1)
	{
		// keep moving closer
		hsp *= 0.5
		if (!place_meeting(x + hsp, y, obj_wall)) x += hsp;
	}
	
	// since we are close enough to the wall, stop movement
	hsp = 0;
} 
x += hsp;

// y collisions
if (place_meeting(x, y + vsp, obj_wall))
{
	// if going down, this implies a floor, reset can_jump
	if (vsp > 0) can_jump = 10;
	
	// x collision but refactored for y
	while (abs(vsp) > 0.1)
	{
		vsp *= 0.5
		if (!place_meeting(x, y + vsp, obj_wall)) y += vsp;
	}
	vsp = 0;
}
y += vsp;

/// ANIMATIONS

// if player airborne, switch to airborne sprite
if (!place_meeting(x,y+1,obj_wall))
{
	
	// handles rolling
	if (sign(hsp) != 0) {
		sprite_index = spr_player_midair_roll
		image_speed = 1;
	} else {
		sprite_index = spr_player_airborne
		image_speed = 0;
	}
	
}
else
{
	// otherwise, check if we need to set it to the running sprite
	image_speed = 1;
	if hsp == 0
	{
		sprite_index = spr_player;
	}
	else 
	{
		sprite_index = spr_player_run
	}
}

// sprite direction
if (hsp != 0) image_xscale = sign(hsp) * scale;