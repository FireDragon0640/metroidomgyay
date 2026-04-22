function damage_player(dmg, iframes){
	if (obj_player.invulnerable != true) {
		if (obj_player.hp > dmg) {
			obj_player.invulnerable = true
			obj_player.hp -= dmg
			show_debug_message(obj_player.hp);
			
			obj_player.image_blend = c_red
			obj_player.alarm[0] = iframes;
		} else {
			instance_destroy(obj_player);
		}
	}
}