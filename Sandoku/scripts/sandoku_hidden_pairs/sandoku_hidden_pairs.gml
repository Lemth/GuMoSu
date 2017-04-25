/// @desc sandoku_hidden_pairs(list)
/// @arg list argument0

var bin=argument0;
var r=0;

/* Hidden Pairs [O(ARRAYS*(ELEMENTS*ELEMENTS))=4608] */
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
		for(var count=2;count<9;count++) {
			r+=sandoku_hidden_pairs_recursive(bin,array,memory,0,count,0,count,0);
		}
	}
}

return r;








/// @desc sandoku_hidden_pairs_recursive(list,array,memory,index,recur,pairs,count,values)
/// @arg list argument0
/// @arg array argument1
/// @arg memory argument2
/// @arg index argument3
/// @arg recur argument4
/// @arg pairs argument5
/// @arg count argument6
/// @arg values argument7

var bin=argument0;
var array=argument1;
var memory=argument2;
var index=argument3;
var recur=argument4;
var pairs=argument5;
var count=argument6;
var values=argument7;
var r=0;

if(count>0) {
	for(var e=index;e<ELEMENTS;e++) {
		if(pop_count(pairs|memory[| e])<=recur) {
			r+=sandoku_hidden_pairs_recursive(bin,array,memory,e+1,recur,pairs|memory[| e],count-1,values|(1<<e));
		}
	}
} else {
	for(var v=pairs;v>0;v&=v-1) {
		bin[| array[| v&-v]]=(bin[| array[| v&-v]]^values)&values;
			if(pop_state(bin[| array[| v&-v]])==1) {
				r+=sandoku_constrain_peers(bin,array[| v&-v]);
				//recursive=max(recursive,recur-count); //THIS IS A COUNTER
			}
		}
	}
}
// HOW ABOUT REPLACING COUNT WITH POPCOUNT OF CURRENT VALUES/BREADCRUMP TRAIL?\
return r;
