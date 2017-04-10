/// @desc sdk_update_for_solved_cell(mainlist,square)
/// @arg mainlist	argument0
/// @arg square		argument1
/// return			solves (or -1 if fail)

var peers=_peers[| argument1];
var value=ds_list_find_index(argument0[| argument1],0);
var solved=0;

if(value>0) {
	for(var i=0;i<38;i++) {
		switch(ds_list_delete_value(argument0[| peers[| i]],value)) {
			case 0:
				return -1;
			case 1:
				var catch=sdk_update_for_solved_cell(argument0,peers[| i]);
				if(catch==-1) {
					return -1;
				}
				solved+=1+catch;
			default:
			break;
		}
	}
	return solved;
}
return 0;
