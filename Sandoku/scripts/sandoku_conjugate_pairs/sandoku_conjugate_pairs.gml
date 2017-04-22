/// @desc sandoku_conjugate_pairs(list)
/// @arg list argument0

var bin=argument0;
var r=0;

/* Conjugate Pairs [O()=] */
for(var a=0;a<ARRAYS;a++) { 
	var array=_arrays[| a];
	for(var count=2;count<9;count++) {
		r+=sandoku_conjugate_pairs_recursive(bin,array,0,count,0,count);
	}
}

return r;