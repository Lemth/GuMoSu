/// @desc scr_solver_2()
/// NAKED PAIRS/TRIPLES (NAKED CANDIDATES)

var returnvalue="No"

/* Conjugate Pairs [O()=] */
var r=0;
for(var a=0;a<ARRAYS;a++) { 
	var array=_arrays[| a];
	
	var empty=0;
	for(var e=0;e<ELEMENTS;e++) {
		if(pop_state(inventory[| array[| e]])==2) {
			empty++;
		}
	}
	
	for(var count=2;count<9;count++) {
		if(count<empty) {
			r+=scr_solver_2b(inventory,array,0,count,0,count);
		}
	}
	if(r>0) {
		returnvalue="Yes";
	}
}


return returnvalue;