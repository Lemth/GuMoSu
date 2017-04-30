/// @desc scr_solver_4()


var returnvalue="No"

for(var count=2;count<9;count++) {

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
		if(count<empty) {
			r+=scr_solver_2b(inventory,array,0,count,0,count);
		}
	}
	if(r>0) {
		returnvalue="Yes";
		break;
	}

	/* Hidden Pairs [O(ARRAYS*(ELEMENTS*ELEMENTS))=4608] */
	for(var a=0;a<ARRAYS;a++) { 
		var array=_arrays[| a];
	
		var empty=0;
		for(var e=0;e<ELEMENTS;e++) {
			if(pop_state(inventory[| array[| e]])==2) {
				empty++;
			}
		}
		var tarray=ds_list_create();
		for(var i=0;i<VALUES;i++) {
			tarray[| i]=0;
		}
		for(var e=0;e<ELEMENTS;e++) {
			if(pop_state(inventory[| array[| e]])==2) {
				for(var v=inventory[| array[| e]];v>0;v&=v-1) {
					tarray[| log2(v&-v)]|=(1<<e);
				}
			}
		}
		if(count<empty) {
			r+=scr_solver_3b(inventory,array,tarray,0,count,count,0,0);
		}
		ds_list_destroy(tarray);
		
	}
	if(r>0) {
		returnvalue="Yes";
		break;
	}
}


return returnvalue;