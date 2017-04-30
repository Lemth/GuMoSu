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
						cartesian|=(1<<(_value_x[array[| log2(n&-n)]]));
						cartesian|=(1<<(_value_y[array[| log2(n&-n)]]+6));
						cartesian|=(1<<(_value_z[array[| log2(n&-n)]]+12));
					}
					if(pop_count(cartesian)==pop_count(tarray[| v])+2) {
						cartesian&=~(1<<a); //remove current array
						var mask=[$3F,$FC0,$3F000];
						if(3==(pop_state(cartesian&mask[0])+pop_state(cartesian&mask[1])+pop_state(cartesian&mask[2]))) { //0+1+2
							for(var i=0;i<3;i++) { //loop through masks (xyz)
								if(pop_state(cartesian&mask[i])==1) { //get axis of pointing
									var parray=_arrays[| log2((cartesian&mask[i])>>(i*6))+i*6]; //convert to pointing array
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
									for(var i=0;i<size;i++) { //loop through filtered pointing squares
										if(pop_state(bin[| psquares[| i]]==2)) {
											bin[| psquares[| i]]&=~(1<<v); //remove value from pointed squares
											recursive=max(recursive,argument1); //THIS IS A COUNTER
											if(pop_state(bin[| psquares[| i]])==1) { //if square is solved
												r+=sandoku_constrain_peers(bin,psquares[| i]); //update peers
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
	}
}

return r;
