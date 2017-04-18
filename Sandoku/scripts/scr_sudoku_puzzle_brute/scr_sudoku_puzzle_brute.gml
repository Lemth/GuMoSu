/// @desc scr_sudoku_puzzle_brute(list)
/// @arg list argument0

var solved=0;
var bin=ds_list_create();
ds_list_copy(bin,argument0);
for(var i=0;i<96;i++) {
	if(scr_count_binary_ones(bin[| i])==1) {
		solved++;
	}
}

while(solved<96) {
	var solving=true;
	
	for(var i=0;i<96;i++) { // CHECK IF PUZZLE IS STILL VALID
		if(bin[| i]==0) {
			ds_list_destroy(bin);
			return false;
		}
	}
	for(var i=0;i<18;i++) {
		var array=_arrays[| i];
		var validate=0;
	    for(var j=0;j<16;j++) {
			if(scr_count_binary_ones(bin[| array[| j]])==1) {
				if(validate&bin[| array[| j]]==0) {
					validate|=bin[| array[| j]];
				} else {
					ds_list_destroy(bin);
					return false;
				}
			}
	    }
	}
	
	for(var i=0;i<96;i++) { // RETURN SINGLES
		if(scr_count_binary_ones(bin[| i])>1) {
			for(var j=0;j<38;j++) {
				var peer=ds_list_find_value(_peers[| i],j);
				if(scr_count_binary_ones(bin[| peer])==1) {
					bin[| i]&=~bin[| peer];
					if (scr_count_binary_ones(bin[| i])==1) {
						solving=false;
						solved++;
						break;
					}
				}
			}
		} 
	}

	if(solving==true) {
		var smallest=0;
		for(var i=0;i<96;i++) { // BRUTE FORCE
			for(var j=2;j<=16;j++) {
				if(scr_popcount(bin[| i])==j) {
					smallest=i;
					break;
				} 
			}
		}
		var bucket=bin[| smallest];
		bin[| smallest]&=-bin[| smallest]; // SET TO LEAST SIGNIFICANT SET BIT
		if(scr_sudoku_puzzle_brute(bin)) { //if solvable
			ds_list_destroy(bin);
			return true; //solvable even in this configuration; not a unique puzzle
		}
		bin[| smallest]=bucket-bin[| smallest]; // RESET EXCEPT FOR TESTED BIT
		if(scr_count_binary_ones(bin[| smallest])==1) {
			solved++;
		}
	}
}

// CHECK IF SOLUTION IS VALID
for(var i=0;i<18;i++) {
	var array=_arrays[| i];
	var validate=0;
    for(var j=0;j<16;j++) {
        validate|=bin[| array[| j]];
    }
    if(validate!=$FFFF) {
		ds_list_destroy(bin);
        return false;
    }
}

ds_list_destroy(bin);
return true;

