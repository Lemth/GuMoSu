/// @desc sdk_naked_pairs(mainlist)
/// @arg mainlist	argument0
/// return			solves (or -1 if fail)
/// http://www.sudokuwiki.org/Naked_Candidates

var solved=0;

for(var i=0;i<18;i++) {
	var bucket=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	var array=_arrays[| i];
	for(var j=0;j<16;j++) {
		if(ds_list_size(argument0[| array[| j]])==2) {
			for(var k=0;k<ds_list_size(argument0[| array[| j]]);k++) {
				bucket[j]=bucket[j]|power(2,ds_list_find_value(argument0[| array[| j]],k)-1); // add to bucket (x OR y)
			}
		} else if (ds_list_size(argument0[| array[| j]])<1) {
			return -1;
		}
	}
	for(var j=0;j<16;j++) {
		if(bucket[j]!=0) {
			for(var k=0;k<j;k++) {
				if(bucket[j]==bucket[k]) {
					for(var l=0;l<38;l++) {
						if(ds_list_find_value(_peers[| array[| j]],l)!=array[| k]) {
							switch(ds_list_delete_value(argument0[| ds_list_find_value(_peers[| array[| j]],l)],ds_list_find_value(array[| j],0))) {
								case 0:
									return -1;
								case 1:
									var catch=sdk_update_for_solved_cell(argument0,ds_list_find_value(_peers[| array[| j]],l));
									if(catch==-1) {
										return -1;
									}
									solved+=1+catch;
								break;
							}
							switch(ds_list_delete_value(argument0[| ds_list_find_value(_peers[| array[| j]],l)],ds_list_find_value(array[| j],1))) {
								case 0:
									return -1;
								case 1:
									var catch=sdk_update_for_solved_cell(argument0,ds_list_find_value(_peers[| array[| j]],l));
									if(catch==-1) {
										return -1;
									}
									solved+=1+catch;
								break;
							}
						}
					}
					for(var l=0;l<38;l++) {
						if(ds_list_find_value(_peers[| array[| k]],l)!=array[| j]) {
							switch(ds_list_delete_value(argument0[| ds_list_find_value(_peers[| array[| k]],l)],ds_list_find_value(array[| k],0))) {
								case 0:
									return -1;
								case 1:
									var catch=sdk_update_for_solved_cell(argument0,ds_list_find_value(_peers[| array[| k]],l));
									if(catch==-1) {
										return -1;
									}
									solved+=1+catch;
								break;
							}
							switch(ds_list_delete_value(argument0[| ds_list_find_value(_peers[| array[| k]],l)],ds_list_find_value(array[| k],1))) {
								case 0:
									return -1;
								case 1:
									var catch=sdk_update_for_solved_cell(argument0,ds_list_find_value(_peers[| array[| k]],l));
									if(catch==-1) {
										return -1;
									}
									solved+=1+catch;
								break;
							}
						}
					}
				}
			}
		}
	}
}
show_debug_message("naked pairs: "+string(solved));
return solved;
