/// @desc sandoku_hidden_pairs(list)
/// @arg list argument0

var bin=argument0;
var r=0;

/* Hidden Pairs [O(ARRAYS*(ELEMENTS*2))=576] */
for(var a=0;a<ARRAYS;a++) { 
	var array=_arrays[| a];
	var values=0;
	var memory=ds_list_create();
	for(var i=0;i<ELEMENTS;i++) {
		memory[| i]=0;
	}
	for(var e=0;e<ELEMENTS;e++) {
		if(pop_state(bin[| array[| e]])==2) {
			values|=bin[| array[| e]];
			for(var v=bin[| array[| e]];v>0;v&=v-1) {
				memory[| log2(v&-v)]|=(1<<e);
			}
		}
	}
	if(values>0) {
		for(var e=0;e<ELEMENTS;e++) {
			
			
			
			for(var count=2;count<9;count++) {
				r+=sandoku_hidden_pairs_recursive(bin,array,0,count,0,count);
			}
			
			
			
			
		}
	}
}

return r;








/// @desc sandoku_hidden_pairs_recursive(list,array,index,recur,pairs,count)
/// @arg list argument0
/// @arg array argument1
/// @arg index argument2
/// @arg recur argument3
/// @arg pairs argument4
/// @arg count argument5

var bin=argument0;
var array=argument1;
var index=argument2;
var recur=argument3;
var pairs=argument4;
var count=argument5;
var r=0;

if(count>0) {
	for(var e=index;e<ELEMENTS;e++) {
		if(pop_state(bin[| array[| e]])==2) {
			if(pop_count(pairs|bin[| array[| e]])<=recur) {
				r+=sandoku_hidden_pairs_recursive(bin,array,e+1,recur,pairs|bin[| array[| e]],count-1);
			}
		}
	}
} else {
	for(var e=0;e<ELEMENTS;e++) {
		if(pop_state(bin[| array[| e]])==2) {
			if(pairs|bin[| array[| e]]!=pairs) {
				bin[| array[| e]]&=~pairs;
				if(pop_state(bin[| array[| e]])==1) {
					r+=sandoku_constrain_peers(bin,array[| e]);
					recursive=max(recursive,recur-count);
				}
			}
		}
	}
}

return r;