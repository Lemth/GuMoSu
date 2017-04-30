/// @desc sandoku_conjugate_pairs(list,count)
/// @arg list argument0
/// @arg count argument1

var bin=argument0;
var r=0;

/* Conjugate Pairs */
for(var a=0;a<ARRAYS;a++) { //loop through each array
	var array=_arrays[| a];
	if(argument1<unsolved_count(bin,array)) { //only continue if there are more unsolved squares than maximum recursion count
		r+=sandoku_conjugate_pairs_recursive(bin,array,0,argument1,argument1,0,0);
	}
}

return r;