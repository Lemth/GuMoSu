/// @desc scr_sudoku_puzzle_brute(list)
/// @arg list argument0

var binlist=ds_list_create();
ds_list_copy(binlist,argument0);

if(sandoku_solver(binlist)) {

	// CHECK IF SOLUTION IS VALID
	for(var i=0;i<ARRAYS;i++) {
		var array=_arrays[| i];
		var validate=0;
	    for(var j=0;j<ELEMENTS;j++) {
	        validate|=binlist[| array[| j]];
	    }
	    if(validate!=$FFFF) {
		
			show_debug_message("esc3");
			ds_list_destroy(binlist);
	        return false;
	    }
	}
	show_debug_message("esc2");
	ds_list_destroy(binlist);
	return true;

} else {

	show_debug_message("esc1");
	ds_list_destroy(binlist);
	return false;
}