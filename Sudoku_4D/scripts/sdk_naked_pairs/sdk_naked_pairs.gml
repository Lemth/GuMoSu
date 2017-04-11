/// @desc sdk_naked_pairs(mainlist)
/// @arg mainlist	argument0
/// return			solves (or -1 if fail)
/// http://www.sudokuwiki.org/Naked_Candidates

var solved=0;

for(var i=0;i<18;i++) { /* loop through arrays 0,1..17 */
	var bucket1=[0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0];
	var bucket2=[0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0];
	var square=[0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0];
	var array=_arrays[| i];
	for(var j=0;j<16;j++) { /* loop through array[i] positions 0,1..15 */
		if(ds_list_size(argument0[| array[| j]])==2) { /* ds_list_size of 2 is required for the naked pair */
			ds_list_sort(argument0[| array[| j]]); /* sort for ease of comparing later on */
			bucket1[j]=ds_list_find_value(argument0[| array[| j]],0); /* add value 1 to bucket1 */
			bucket2[j]=ds_list_find_value(argument0[| array[| j]],1); /* add value 2 to bucket2 */
			square[j]=array[| j]; /* remember this square */
		} else if (ds_list_size(argument0[| array[| j]])<1) {
			return -1; /* ds_list_size of 0 => unsolvable */
		}
	}
	for(var j=0;j<16;j++) { 
		if(bucket1[j]!=0) { /* skip if empty */
			for(var k=0;k<j;k++) {
				if(bucket1[j]==bucket1[k] && bucket2[j]==bucket2[k]) { /* check if both buckets have same content */
					for(var l=0;l<38;l++) {
						if(ds_list_find_value(_peers[| square[j]],l)!=square[k]) { /* skip if peer[j] is same as square[k] */
								   ds_list_delete_value(argument0[| ds_list_find_value(_peers[| square[j]],l)],bucket1[j]);
							switch(ds_list_delete_value(argument0[| ds_list_find_value(_peers[| square[j]],l)],bucket2[j])) {
								case 0:
									return -1;
								case 1:
									var catch=sdk_update_for_solved_cell(argument0,ds_list_find_value(_peers[| square[j]],l));
									if(catch==-1) {
										return -1;
									}
									solved+=1+catch;
								break;
							} /* check only after second delete_value for better readable code and efficiency */
						}
					}
					for(var l=0;l<38;l++) {
						if(ds_list_find_value(_peers[| square[k]],l)!=square[j]) { /* skip if peer[j] is same as square[k] */
								   ds_list_delete_value(argument0[| ds_list_find_value(_peers[| square[k]],l)],bucket1[k]);
							switch(ds_list_delete_value(argument0[| ds_list_find_value(_peers[| square[k]],l)],bucket2[k])) {
								case 0:
									return -1;
								case 1:
									var catch=sdk_update_for_solved_cell(argument0,ds_list_find_value(_peers[| square[k]],l));
									if(catch==-1) {
										return -1;
									}
									solved+=1+catch;
								break;
							} /* check only after second delete_value for better readable code and efficiency */
						}
					}
				}
			}
		}
	}
}
show_debug_message("naked pairs: "+string(solved));
return solved;
