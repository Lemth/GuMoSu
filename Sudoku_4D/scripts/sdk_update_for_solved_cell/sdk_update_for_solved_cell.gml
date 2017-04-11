/// @desc sdk_update_for_solved_cell(mainlist,square)
/// @arg mainlist	argument0
/// @arg square		argument1
/// return			solves (or -1 if fail)

var peers=_peers[| argument1]; /* peers => _peers[square] */
var value=ds_list_find_index(argument0[| argument1],0); /* value that was set in current square (1-16) */
var solved=0;

if(value>0) { /* REMOVE THIS CHECK IF NO MESSAGES ENCOUNTERED */
	for(var i=0;i<38;i++) { /* loop through all peers: 0,1..37 */
		switch(ds_list_delete_value(argument0[| peers[| i]],value)) { /* remove value from peer[i] of square */
			case 0:
				return -1; /* ds_list_size of 0 => unsolvable */
			case 1:
				var catch=sdk_update_for_solved_cell(argument0,peers[| i]); /* recursive */
				if(catch==-1) { return -1; } /* ds_list_size of 0 => unsolvable */
				solved+=1+catch; /* solved = 1+"recursive solves" */
			default:
			break;
		}
	}
	return solved;
} else {
	show_debug_message("DO NOT REMOVE THIS CHECK IN sdk_update_for_solved_cell(mainlist,square)");	
}
return 0; /* only is value is not 1,2..16 does this ever happen? SEE MESSAGE ABOVE */
