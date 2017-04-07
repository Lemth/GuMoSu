/// @desc ds_list_destroy_nested(list)
/// @arg list argument0

if(ds_exists(argument0,ds_type_list)) {
	show_debug_message("s:"+string(argument0));
	for(var i=0;i<ds_list_size(argument0);i++) {
		if(ds_exists(ds_list_find_value(argument0,i),ds_type_list)) {
			ds_list_destroy(ds_list_find_value(argument0,i));
		}
	}
	ds_list_destroy(argument0);
	return true;
} else {
	return false;
}
