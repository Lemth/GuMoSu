/// @desc sdk_show_possibles(mainlist)
/// @arg mainlist	argument0
/// return			solves (or -1 if fail)

var solved=0;

for(var i=0;i<96;i++) { // RETURN SINGLES
	if(ds_list_size(argument0[| i])>1) {
		var peers=_peers[| i];
		for(var j=0;j<38;j++) { // loop through _peers[i]
			if(ds_list_size(argument0[| peers[| j]])==1) { // if peer ds_list_size 1 delete that value from i
				switch(ds_list_delete_value(argument0[| i],ds_list_find_value(argument0[| peers[| j]],0))) {
					case 0:
						return -1;
					case 1:
						var catch=sdk_update_for_solved_cell(argument0,i);
						if(catch==-1) {
							return -1;
						}
						solved+=1+catch;
					break;
				}
			}
		}
	} else if (ds_list_size(argument0[| i])<1) {
		return -1; 
	}
}
show_debug_message("show possibles: "+string(solved));
return solved;
