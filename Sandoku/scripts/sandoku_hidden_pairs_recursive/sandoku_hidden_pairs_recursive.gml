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
		if(memory[| e]>0) {
			if(pop_count(pairs|memory[| e])<=recur) {
				r+=sandoku_hidden_pairs_recursive(bin,array,memory,e+1,recur,pairs|memory[| e],count-1,values|(1<<e));
			}
		}
	}
} else {
	for(var v=pairs;v>0;v&=v-1) {
		var s=array[| log2(v&-v)];
		if(pop_state(bin[| s])==2) {
			bin[| s]&=values;
			if(pop_state(bin[| s])==1) {
				r+=sandoku_constrain_peers(bin,s);
				recursive=max(recursive,recur-count); //THIS IS A COUNTER
			}
		}
	}
}
// HOW ABOUT REPLACING COUNT WITH POPCOUNT OF CURRENT VALUES/BREADCRUMP TRAIL?\
return r;