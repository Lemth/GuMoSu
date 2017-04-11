/// @desc sdk_hidden_pairs(mainlist)
/// @arg mainlist	argument0
/// return			solves (or -1 if fail)
/// http://www.sudokuwiki.org/Hidden_Candidates

var solved=0;

for(var i=0;i<18;i++) { /* loop through arrays 0,1..17 */
	var bucket=[0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0];
	var square1=[0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0];
	var square2=[0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0];
	var array=_arrays[| i];
	for(var j=0;j<16;j++) { /* loop through array[i] squares 0,1..15 */
		if(ds_list_size(argument0[| array[| j]])>1) { /* part of pair needs at least 2 values */
			for(var k=0;k<ds_list_size(argument0[| array[| j]]);k++) {
				var index=ds_list_find_value(argument0[| array[| j]],k)-1; /* index=value-1 */
				bucket[index]+=1; // add to bucket
				if(square1[index]==0) {
					square1[index]=array[| j]; // remember first square
				} else {
					square2[index]=array[| j]; // remember last square
				}
			}
		} else if (ds_list_size(argument0[| array[| j]])<1) {
			return -1; /* ds_list_size of 0 => unsolvable */
		}
	}
	for(var j=0;j<16;j++) {
		if(bucket[j]==2) { /* check if j is a pair */
			for(var k=0;k<j;k++) {
				if(bucket[k]==2 && square1[j]==square1[k] && square2[j]==square2[k]) { /* check if k is also pair and matches first and last square */
					ds_list_clear(argument0[| square1[j]]); /* first square */
					ds_list_clear(argument0[| square2[j]]); /* last square */
					ds_list_add(argument0[| square1[j]],j+1,k+1); /* value=index+1 */
					ds_list_add(argument0[| square2[j]],j+1,k+1); /* value=index+1 */
					solved=1;
				}
			}
		}
	}
}
show_debug_message("hidden pairs: "+string(solved));
return solved;
