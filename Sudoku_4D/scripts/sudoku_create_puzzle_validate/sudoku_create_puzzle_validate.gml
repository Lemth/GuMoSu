/// @desc sudoku_create_puzzle_validate(list)
/// @arg list argument0

for(var i=0;i<96;i++) {
	check[i]=string(ds_list_find_value(argument0[| i],0))+"/"+string(ds_list_size(argument0[| i]));
	// RETURN DOES SOME UNDEFINEDS AT START (seem ok.)
	// HIDDEN BRINGS IN MOST NUMBERS. .. seems faulty.
	// CHECK results in list sizes of ONE and all the same number...
	// 15 undefined ?!?!?!
}

for(var i=0;i<96;i++) {
	if(ds_list_size(argument0[| i])!=1) {
		show_debug_message("dssize: "+string(ds_list_size(argument0[| i])));
		return false;
	}
}

for(var i=0;i<6;i++) { //check faces
	var validate=0;
    for(var j=0;j<16;j++) {
        validate=validate|power(2,ds_list_find_value(argument0[| 16*i+j],0)-1);
    }
	show_debug_message("validate: "+string(validate));
    if(validate!=65535) {
        //ds_list_destroy_nested(argument0);
        return false;
    }
}
for(var i=0;i<12;i++) { //check columns/rows/...
	var validate=0;
    for(var j=0;j<16;j++) {
        validate=validate|power(2,ds_list_find_value(argument0[| _order_xy[16*i+j]],0)-1);
    }
	show_debug_message("validate2: "+string(validate));
    if(validate!=65535) {
        //ds_list_destroy_nested(argument0);
        return false;
    }
}


ds_list_destroy_nested(argument0);
return true;
