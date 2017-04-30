/// @desc sandoku_pointing_pairs(list,count)
/// @arg list argument0
/// @arg count argument1

var bin=argument0;
var r=0;

/* Pointing Pairs */
for(var a=0;a<ARRAYS;a++) { //loop through each array
	var array=_arrays[| a];
	if(argument1<unsolved_count(bin,array)) { //only continue if there are more unsolved squares than maximum recursion count
		var tarray=ds_list_create();
		for(var e=0;e<ELEMENTS;e++) { //loop through each element
			if(pop_state(bin[| array[| e]])==2) { //if unsolved
				for(var n=bin[| array[| e]];n>0;n&=n-1) { //transpose array to 'tarray'
					tarray[| log2(n&-n)]|=(1<<e); //swap elements and values
				}
			}
		}
		for(var v=0;v<VALUES;v++) { //loop through each value
			if(pop_state(tarray[| v])==2) { //if unsolved value
				if(pop_count(tarray[| v])==argument1) {
					var cartesian=0;
					for(var n=tarray[| v];n>0;n&=n-1) { //add xyz coordinates should be in groups of recur+1+1.
						cartesian|=_cartesian[| array[| log2(n&-n)]];
					}
					if(pop_count(cartesian)==argument1+2) {
						cartesian&=~(1<<a); //remove current array
						while(cartesian_array(cartesian)) {
							var c=cartesian_array(cartesian);
							var parray=_arrays[| c]; //get pointing array
							cartesian&=~(1<<c); //update cartesian by removing current pointing array
							var psquares=ds_list_create();
							for(var e=0;e<ELEMENTS;e++) { //loop through elements of pointing array
								if(pop_state(bin[| parray[| e]])==2) { //if unsolved
									ds_list_add(psquares,parray[| e]); //add squares from pointing array
								}
							}
							for(var n=tarray[| v];n>0;n&=n-1) { //loop through pointing squares
								ds_list_delete_value(psquares,array[| log2(n&-n)]); //remove initial pointing squares
							}
							var size=ds_list_size(psquares);
							for(var p=0;p<size;p++) { //loop through filtered pointing squares
								if(pop_state(bin[| psquares[| p]])==2) {
									bin[| psquares[| p]]&=~(1<<v); //remove value from pointed squares
									depth_pointing=max(depth_pointing,argument1);
									if(pop_state(bin[| psquares[| p]])==1) { //if square is solved
										r+=sandoku_constrain_peers(bin,psquares[| p]); //update peers
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

return r;
