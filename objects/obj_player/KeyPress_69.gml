var _beam = instance_create_layer(x + (15 * image_xscale), y - 10, "Projectiles", obj_beam)

if (sign(image_xscale) == -1) {
	show_debug_message("left");
	_beam.direction = 180;
}