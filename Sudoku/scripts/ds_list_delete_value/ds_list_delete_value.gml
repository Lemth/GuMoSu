/// @desc ds_list_delete_value(id,value)
/// @arg id		argument0
/// @arg value	argument1

if(ds_list_find_index(argument0,argument1)!=-1) {
	ds_list_delete(argument0,ds_list_find_index(argument0,argument1));
	return ds_list_size(argument0);
} else {
	return -1;
}
