/// @desc sdk_hidden_singles(mainlist)
/// @arg mainlist	argument0
/// return			solves (or -1 if fail)
/// http://www.sudokuwiki.org/Getting_Started

var solved=0;

for(var i=0;i<18;i++) { /* loop through arrays 0,1..17 */
	var bucket=[0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0]; /* 16 */
	var single=[0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0]; /* 16 */
	var array=_arrays[| i]; /* array => current array */
	for(var j=0;j<16;j++) { /* 16 values per array (0,1..15) */
		if(ds_list_size(argument0[| array[| j]])>1) { /* if current square in this array has multiple values (>1) */
			for(var k=0;k<ds_list_size(argument0[| array[| j]]);k++) {  /* for all values (k:1,2..16) in square | -1 to start at 0*/
				bucket[ds_list_find_value(argument0[| array[| j]],k)-1]+=1; // add to bucket
				single[ds_list_find_value(argument0[| array[| j]],k)-1]=array[| j]; // remember last square
			}
		} else if (ds_list_size(argument0[| array[| j]])==1) { /* disable this bucket */
			bucket[ds_list_find_value(argument0[| array[| j]],0)-1]+=16; /* if no message; then remove */
		}
		} else if (ds_list_size(argument0[| array[| j]])<1) {
			return -1; /* ds_list_size of 0 => unsolvable */
		}
	}
	for(var j=0;j<16;j++) { /* loop through bucket 0,1..15 (representing 1,2..16) */
		if(bucket[j]==1) { /* if hidden single */
			ds_list_clear(argument0[| single[j]]); /* clear square */
			ds_list_add(argument0[| single[j]],j+1); /* add value based on bucket position+1 */
			var catch=sdk_update_for_solved_cell(argument0,single[j]); /* update for solved square */
			if(catch==-1) {
				return -1; /* ds_list_size of 0 => unsolvable */
			}
			solved+=1+catch; /* solved=1+"solves from updating the square" */
		} else if (bucket[j]==17) {
			show_debug_message("SOMETHING WENT WRONG IN sdk_hidden_singles(mainlist)"); /* if no message; then remove */
		}
	}
}
show_debug_message("hidden singles: "+string(solved));
return solved;
