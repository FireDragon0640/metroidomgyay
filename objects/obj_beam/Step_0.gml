var _inst = instance_place(x, y, all);

if (_inst != noone) {
	if (object_is_ancestor(_inst.object_index, obj_enemy_parent)) {
		
		// run enemy damage code
		instance_destroy();
		if _inst.hp > 1 {
			// flash effect
			_inst.image_blend = c_red;
			_inst.alarm[0] = 5;
			
			_inst.hp -= 1
		} else {
			instance_destroy(_inst);
		}
		
	} else if !(_inst.layer == layer_get_id("Player")) {
		instance_destroy();
	}
	show_debug_message("hit");
}