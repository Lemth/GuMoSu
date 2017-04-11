/// @desc sdk_last_possible_number(mainlist)
/// @arg mainlist	argument0
/// return			solves (or -1 if fail)
/// http://www.sudokuwiki.org/Getting_Started

var solved=0;

for(var i=0;i<96;i++) { // HIDDEN SINGLES
	if(ds_list_size(argument0[| i])>1) { /* if square has multiple values */
		var bucket=0;
		var peers=_peers[| i]; /* peers of i */
		for(var j=0;j<38;j++) {
			if(ds_list_size(argument0[| peers[| j]])==1) { /* if peer has list size of 1 */
				bucket=bucket|power(2,ds_list_find_value(argument0[| peers[| j]],0)-1); //x OR y
			} /* -1 to fit bucket */
		}
		bucket=65535-bucket; /* flip bits: (65535)= 1111 1111 1111 1111 */
		if(bucket!=0 && ((bucket&(bucket-1))==0)) { /* if not 0; and if power of 2 */
			ds_list_clear(argument0[| i]); /* clear square */
			ds_list_add(argument0[| i],log2(bucket)+1); /* +1 'cause bucket log2 starts at 0 instead of 1 */
			var catch=sdk_update_for_solved_cell(argument0,i); /* update for i */
			if(catch==-1) { return -1; } /* ds_list_size of 0 => unsolvable */
			solved+=1+catch; /* solved=1+"solves from updating for i" */
		} else if (bucket==0) {
			show_debug_message("SOMETHING WRONG IN sdk_last_possible_number(mainlist)"); /* remove if not required */	
			return -1; /* ds_list_size of 0 => unsolvable */	
		}
	} else if (ds_list_size(argument0[| i])<1) {
		return -1; /* ds_list_size of 0 => unsolvable */
	}
}

show_debug_message("last possible number: "+string(solved));
return solved;
