/// @desc sdk_hidden_pairs(mainlist)
/// @arg mainlist	argument0
/// return			solves (or -1 if fail)
/// http://www.sudokuwiki.org/Hidden_Candidates

var solved=0;

for(var i=0;i<18;i++) {
	var bucket=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	var single=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	var array=_arrays[| i];
	for(var j=0;j<16;j++) {
		if(ds_list_size(argument0[| array[| j]])>2) {
			for(var k=0;k<ds_list_size(argument0[| array[| j]]);k++) {
				bucket[ds_list_find_value(argument0[| array[| j]],k)-1]+=1; // add to bucket
				single[ds_list_find_value(argument0[| array[| j]],k)-1]=array[| j]; // remember last square
			}
		} else if (ds_list_size(argument0[| array[| j]])<1) {
			return -1;
		}
	}
	for(var j=0;j<16;j++) {
		if(bucket[j]==2) {
			for(var k=0;k<j;k++) {
				if(bucket[k]==2 && single[j]==single[k]) {
					if(ds_list_find_index(argument0[| single[j]],j+1)!=-1 && ds_list_find_index(argument0[| single[j]],k+1)!=-1
					&& ds_list_find_index(argument0[| single[k]],j+1)!=-1 && ds_list_find_index(argument0[| single[k]],k+1)!=-1) {
						ds_list_clear(argument0[| single[j]]);
						ds_list_clear(argument0[| single[k]]);
						ds_list_add(argument0[| single[j]],j+1,k+1);
						ds_list_add(argument0[| single[k]],j+1,k+1);
						solved=1;
					}
				}
			}
		}
	}
}
show_debug_message("hidden pairs: "+string(solved));
return solved;
