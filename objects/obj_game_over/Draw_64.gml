if (game_over) {
	instance_destroy(obj_player);
	
	// draw game over screen
	show_debug_message("game over");
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(font0);
	
	var cx = room_width / 2;
	var cy = room_height / 2;

	if (won) {
		if (array_length(layer_get_all_elements(layer_get_id("Enemies"))) > 0) {
			draw_set_color(c_yellow);
			draw_text(cx, cy, "You may have escaped...");
			draw_set_font(font0_1);
			draw_text(cx, cy + 40, "But some enemies remain.");
		} else {
			draw_set_color(c_green);
			draw_text(cx, cy, "You won!");
			
			if final_hp == 5 {
				draw_set_font(font0_1);
				draw_text(cx, cy + 40, "And without a scratch on you?!");
			}
		}
	} else {
		draw_set_color(c_red);
		draw_text(cx, cy, "Game Over");
	}
}