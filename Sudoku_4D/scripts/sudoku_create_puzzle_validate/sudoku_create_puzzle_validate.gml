/// @desc sudoku_create_puzzle_validate(list)
/// @arg list argument0

for(var i=0;i<96;i++) {
	if(ds_list_size(argument0[| i])<1) {
		return false;
	}
}

show_debug_message(string(ds_list_find_value(argument0[| i],0)));

for(var i=0;i<6;i++) { //check faces
	var validate=0;
    for(var j=0;j<16;j++) {
        validate=validate|power(2,ds_list_find_value(argument0[| 16*i+j],0)-1);
    }
	show_debug_message(string(validate));
    if(validate!=65535) {
        ds_list_destroy_nested(argument0);
        return false;
    }
}
for(var i=0;i<12;i++) { //check columns/rows/...
	var validate=0;
    for(var j=0;j<16;j++) {
        validate=validate|power(2,ds_list_find_value(argument0[| _order_xy[16*i+j]],0)-1);
    }
    if(validate!=65535) {
        ds_list_destroy_nested(argument0);
        return false;
    }
}

ds_list_destroy_nested(argument0);
for(var i=0;i<96;i++) {
	check[i]=check[i]==0 ? ds_list_find_value(argument0[| i],0) : check[i];
}
return true;
