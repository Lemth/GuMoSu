/// @desc ds_list_destroy_nested(list)
/// @arg list argument0

for(var i=0;i<ds_list_size(argument0);i++) {
	if(argument0[| i]>0) {
		ds_list_destroy(argument0[| i]);
	}
}
ds_list_destroy(argument0);
return 1;
