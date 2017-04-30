/// @desc scr_solver_5()

var returnvalue="No";

var bin=inventory;
var r=0;
for(var count=2;count<=4;count++) {

	/* Pointing Pairs */
	for(var a=0;a<ARRAYS;a++) { //loop through each array
		var array=_arrays[| a];
		if(count<unsolved_count(inventory,array)) { //only continue if there are more unsolved squares than maximum recursion count
			var tarray=ds_list_create();
			for(var e=0;e<ELEMENTS;e++) { //loop through each element
				if(pop_state(inventory[| array[| e]])==2) { //if unsolved
					for(var n=inventory[| array[| e]];n>0;n&=n-1) { //transpose array to 'tarray'
						tarray[| log2(n&-n)]|=(1<<e); //swap elements and values
					}
				}
			}
			for(var v=0;v<VALUES;v++) { //loop through each value
				if(pop_state(tarray[| v])==2) { //if unsolved value
					if(pop_count(tarray[| v])==count) {
						var cartesian=0;
						for(var n=tarray[| v];n>0;n&=n-1) { //add xyz coordinates should be in groups of recur+1+1.
							cartesian|=_cartesian[| array[| log2(n&-n)]];
						}
						if(pop_count(cartesian)==count+2) {
							cartesian&=~(1<<a); //remove current array
							while(cartesian_array(cartesian)) {
								var c=cartesian_array(cartesian);
								var parray=_arrays[| c]; //get pointing array
								cartesian&=~(1<<c); //update cartesian by removing current pointing array
								var psquares=ds_list_create();
								for(var e=0;e<ELEMENTS;e++) { //loop through elements of pointing array
									if(pop_state(inventory[| parray[| e]])==2) { //if unsolved
										ds_list_add(psquares,parray[| e]); //add squares from pointing array
									}
								}
								for(var n=tarray[| v];n>0;n&=n-1) { //loop through pointing squares
									squarecolor[| array[| log2(n&-n)]]=c_green;
									ds_list_delete_value(psquares,array[| log2(n&-n)]); //remove initial pointing squares
								}
								var size=ds_list_size(psquares);
								for(var p=0;p<size;p++) { //loop through filtered pointing squares
									if(pop_state(inventory[| psquares[| p]])==2) {
										//inventory[| psquares[| p]]&=~(1<<v); //remove value from pointed squares
										if(inventory[| psquares[| p]]|(1<<v)==inventory[| psquares[| p]]) {
											ds_list_replace(coloring[| psquares[| p]],v,c_yellow);
											returnvalue="Yes";
										}
									}
								}
								ds_list_destroy(psquares);
							}
						}
					}
				}
			}
		}
	}

	if(returnvalue=="Yes") {
		break;
	}

}

return returnvalue;