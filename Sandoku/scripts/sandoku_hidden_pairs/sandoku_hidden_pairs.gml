/// @desc sandoku_hidden_pairs(list)
/// @arg list argument0

var bin=argument0;
var r=0;

/* Hidden Pairs [O(ARRAYS*(ELEMENTS*ELEMENTS))=4608] */
for(var a=0;a<ARRAYS;a++) { 
	var array=_arrays[| a];
	var unsolved=false;
	var memory=ds_list_create();
	for(var i=0;i<VALUES;i++) {
		memory[| i]=0;
	}
	for(var e=0;e<ELEMENTS;e++) {
		if(pop_state(bin[| array[| e]])==2) {
			unsolved=true;
			for(var v=bin[| array[| e]];v>0;v&=v-1) {
				memory[| log2(v&-v)]|=(1<<e);
			}
		}
	}
	if(unsolved) {
		for(var count=2;count<4;count++) {
			r+=sandoku_hidden_pairs_recursive(bin,array,memory,0,count,0,count,0);
		}
	}
	ds_list_destroy(memory);
}


return r;