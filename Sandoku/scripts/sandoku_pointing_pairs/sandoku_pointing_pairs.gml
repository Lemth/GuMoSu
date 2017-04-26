/// @desc sandoku_pointing_pairs(list)
/// @arg list argument0

var bin=argument0;
var r=0;

/* Pointing Pairs [O(ARRAYS*(ELEMENTS*ELEMENTS))=4608] */
for(var a=0;a<ARRAYS;a++) { 
	var array=_arrays[| a];
	var memory=ds_list_create();
	for(var i=0;i<VALUES;i++) {
		memory[| i]=0;
	}
	for(var e=0;e<ELEMENTS;e++) {
		if(pop_state(bin[| array[| e]])==2) {
			for(var v=bin[| array[| e]];v>0;v&=v-1) {
				memory[| log2(v&-v)]|=(1<<e);
			}
		}
	}
	for(var v;v<VALUES;v++) {
		if(pop_state(memory[| v])==2) {
			if(pop_count(memory[| v])<=4) {
				var tensor=0;
				for(var i=memory[| v];i>0;i&=i-1) {
					tensor|=(1<<_value_x[array[| log2(i&-i)]]);
					tensor|=(1<<(_value_y[array[| log2(i&-i)]]+6));
					tensor|=(1<<(_value_z[array[| log2(i&-i)]]+12));
				}
				//memory pc=2 -> tensor pc=4 V pc>4 X
				//memory pc=3 -> tensor pc=5 V pc>5 X
				//memory pc=4 -> tensor pc=6 V pc>6 X
				if(pop_count(tensor)==pop_count(memory[| v])+2) {
					tensor&=~(1<<a);	
				}
			}
		}
	}
}






/* Pointing Pairs [O(ARRAYS*(ELEMENTS*ELEMENTS))=4608] */
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
			r+=sandoku_pointing_pairs_recursive(bin,array,memory,0,count,0,count,0);
		}
	}
	ds_list_destroy(memory);
}

return r;

/// @desc sandoku_pointing_pairs_recursive(list,array,memory,index,recur,pairs,count,values)
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
				r+=sandoku_pointing_pairs_recursive(bin,array,memory,e+1,recur,pairs|memory[| e],count-1,values|(1<<e));
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
