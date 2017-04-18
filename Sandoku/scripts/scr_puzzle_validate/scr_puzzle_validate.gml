/// @desc scr_puzzle_validate()

for(var i=0;i<18;i++) {
	var array=_arrays[| i];
	var validate=0;
    for(var j=0;j<16;j++) {
		if(scr_count_binary_ones(inventory[| array[| j]])==1) {
			if(validate&inventory[| array[| j]]==0) {
				validate|=inventory[| array[| j]];
			} else {
				return false;
			}
		}
    }
}

return true;
