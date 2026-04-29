draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font0);

if hp > 3 draw_set_colour(c_white) else if hp > 1 draw_set_colour(c_yellow); else draw_set_colour(c_red);

draw_text(100, 50, string_concat("HP: ", hp));