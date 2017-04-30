/// @desc sandoku_hidden_pairs(list,count)
/// @arg list argument0
/// @arg count argument1

var bin=argument0;
var r=0;

/* Hidden Pairs */
for(var a=0;a<ARRAYS;a++) { //loop through each array
	var array=_arrays[| a];
	if(argument1<unsolved_count(bin,array)) { //only continue if there are more unsolved squares than maximum recursion count
		var tarray=ds_list_create();
		for(var e=0;e<ELEMENTS;e++) { //loop through each element
			if(pop_state(bin[| array[| e]])==2) { //if unsolved
				for(var n=bin[| array[| e]];n>0;n&=n-1) { //transpose array to 'tarray'
					tarray[| log2(n&-n)]|=(1<<e); //swap elements and values
				}
			}
		}
		r+=sandoku_hidden_pairs_recursive(bin,array,tarray,0,argument1,argument1,0,0);
		ds_list_destroy(tarray);
	}
}


return r;