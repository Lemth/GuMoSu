/// @desc sdk_pointing_pairs(mainlist)
/// @arg mainlist	argument0
/// return			solves (or -1 if fail)
/// http://www.sudokuwiki.org/intersection_removal

var solved=0;

for(var i=0;i<18;i++) { /* loop through arrays 0,1..17 */
	var bucket=[0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0];
	var square1=[0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0];
	var square2=[0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0];
	var array=_arrays[| i];
	for(var j=0;j<16;j++) { /* loop through array[i] squares 0,1..15 */
		if(ds_list_size(argument0[| array[| j]])>1) { /* at least 2 values for pointing pair */
			for(var k=0;k<ds_list_size(argument0[| array[| j]]);k++) {
				var index=ds_list_find_value(argument0[| array[| j]],k)-1;
				bucket[index]+=1; // add to bucket
				if(square1[index]==0) {
					square1[index]=array[| j]; // remember first square
				} else {
					square2[index]=array[| j]; // remember last square
				}
			}
		} else if (ds_list_size(argument0[| array[| j]])<1) {
			return -1; /* ds_lise_size of 0 => unsolvable */
		}
	}
	for(var j=0;j<16;j++) { /* loop through index 0,1..15 */
		if(bucket[j]==2) {
			if(i<6) { /* same x */
				if(_value_y[square1[j]]==_value_y[square2[j]]) { /* check y */
					array=_arrays[| _value_y[square1[j]]+6];
					for(var k=0;k<16;k++) { /* loop through array's squares 0,1..15 */
						if(array[| k]!=square1[j] && array[| k]!=square2[j]) { /* if not first/last square */
							switch(ds_list_delete_value(argument0[| array[| k]],j+1)) { /* value=index+1 */
								case 0:
									return -1; /* ds_lise_size of 0 => unsolvable */
								case 1:
									var catch=sdk_update_for_solved_cell(argument0,array[| k]);
									if(catch==-1) { return -1; } /* ds_lise_size of 0 => unsolvable */
									solved+=1+catch; /* solved=1+"solves from updating square" */
								default:
								break;
							}
						}
					}
				}
				if(_value_z[square1[j]]==_value_z[square2[j]]) { /* check z */
					array=_arrays[| _value_y[square1[j]]+12];
					for(var k=0;k<16;k++) { /* loop through array's squares 0,1..15 */
						if(array[| k]!=square1[j] && array[| k]!=square2[j]) { /* if not first/last square */
							switch(ds_list_delete_value(argument0[| array[| k]],j+1)) { /* value=index+1 */
								case 0:
									return -1; /* ds_lise_size of 0 => unsolvable */
								case 1:
									var catch=sdk_update_for_solved_cell(argument0,array[| k]);
									if(catch==-1) { return -1; } /* ds_lise_size of 0 => unsolvable */
									solved+=1+catch; /* solved=1+"solves from updating square" */
								default:
								break;
							}
						}
					}
				}
			} else if (i<12) { /* same y */
				if(_value_z[square1[j]]==_value_z[square2[j]]) { /* check z */
					array=_arrays[| _value_y[square1[j]]+12];
					for(var k=0;k<16;k++) { /* loop through array's squares 0,1..15 */
						if(array[| k]!=square1[j] && array[| k]!=square2[j]) { /* if not first/last square */
							switch(ds_list_delete_value(argument0[| array[| k]],j+1)) { /* value=index+1 */
								case 0:
									return -1; /* ds_lise_size of 0 => unsolvable */
								case 1:
									var catch=sdk_update_for_solved_cell(argument0,array[| k]);
									if(catch==-1) { return -1; } /* ds_lise_size of 0 => unsolvable */
									solved+=1+catch; /* solved=1+"solves from updating square" */
								default:
								break;
							}
						}
					}
				}
				if(_value_x[square1[j]]==_value_x[square2[j]]) { /* check x */
					array=_arrays[| _value_y[square1[j]]];
					for(var k=0;k<16;k++) { /* loop through array's squares 0,1..15 */
						if(array[| k]!=square1[j] && array[| k]!=square2[j]) { /* if not first/last square */
							switch(ds_list_delete_value(argument0[| array[| k]],j+1)) { /* value=index+1 */
								case 0:
									return -1; /* ds_lise_size of 0 => unsolvable */
								case 1:
									var catch=sdk_update_for_solved_cell(argument0,array[| k]);
									if(catch==-1) { return -1; } /* ds_lise_size of 0 => unsolvable */
									solved+=1+catch; /* solved=1+"solves from updating square" */
								default:
								break;
							}
						}
					}
				}
			} else if (i<18) { /* same z */
				if(_value_x[square1[j]]==_value_x[square2[j]]) { /* check x */
					array=_arrays[| _value_y[square1[j]]];
					for(var k=0;k<16;k++) { /* loop through array's squares 0,1..15 */
						if(array[| k]!=square1[j] && array[| k]!=square2[j]) { /* if not first/last square */
							switch(ds_list_delete_value(argument0[| array[| k]],j+1)) { /* value=index+1 */
								case 0:
									return -1; /* ds_lise_size of 0 => unsolvable */
								case 1:
									var catch=sdk_update_for_solved_cell(argument0,array[| k]);
									if(catch==-1) { return -1; } /* ds_lise_size of 0 => unsolvable */
									solved+=1+catch; /* solved=1+"solves from updating square" */
								default:
								break;
							}
						}
					}
				}
				if(_value_y[square1[j]]==_value_y[square2[j]]) { /* check y */
					array=_arrays[| _value_y[square1[j]]+6];
					for(var k=0;k<16;k++) { /* loop through array's squares 0,1..15 */
						if(array[| k]!=square1[j] && array[| k]!=square2[j]) { /* if not first/last square */
							switch(ds_list_delete_value(argument0[| array[| k]],j+1)) { /* value=index+1 */
								case 0:
									return -1; /* ds_lise_size of 0 => unsolvable */
								case 1:
									var catch=sdk_update_for_solved_cell(argument0,array[| k]);
									if(catch==-1) { return -1; } /* ds_lise_size of 0 => unsolvable */
									solved+=1+catch; /* solved=1+"solves from updating square" */
								default:
								break;
							}
						}
					}
				}
			}
		}
	}
}
show_debug_message("pointing pairs: "+string(solved));
/// PROBLEMATIC. REMOVING SOLVED SQUARES
return solved;
