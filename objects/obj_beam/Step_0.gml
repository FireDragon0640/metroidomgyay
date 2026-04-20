var _inst = instance_place(x, y, all);

if (_inst != noone) {
	if (object_is_ancestor(_inst.object_index, obj_enemy_parent)) {
		instance_destroy(_inst);
	}
	if !(_inst.layer == layer_get_id("Player")) {
		instance_destroy();
	}
}