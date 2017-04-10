/// @desc sdk_hidden_singles(mainlist)
/// @arg mainlist	argument0
/// return			solves (or -1 if fail)
/// http://www.sudokuwiki.org/Getting_Started

var solved=0;

for(var i=0;i<18;i++) {
	var bucket=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	var single=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	var array=_arrays[| i];
	for(var j=0;j<16;j++) {
		if(ds_list_size(argument0[| array[| j]])>1) {
			for(var k=0;k<ds_list_size(argument0[| array[| j]]);k++) {
				bucket[ds_list_find_value(argument0[| array[| j]],k)-1]+=1; // add to bucket
				single[ds_list_find_value(argument0[| array[| j]],k)-1]=array[| j]; // remember last square
			}
		} else if (ds_list_size(argument0[| array[| j]])<1) {
			return -1;
		}
	}
	for(var j=0;j<16;j++) {
		if(bucket[j]==1) {
			ds_list_clear(argument0[| single[j]]);
			ds_list_add(argument0[| single[j]],j+1);
			var catch=sdk_update_for_solved_cell(argument0,single[j]);
			if(catch==-1) {
				return -1;
			}
			solved+=1+catch;
		}
	}
}
show_debug_message("hidden singles: "+string(solved));
return solved;
