/// @desc scr_solver_2b(list,array,index,recur,pairs,count)
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
				r+=scr_solver_2b(bin,array,e+1,recur,pairs|bin[| array[| e]],count-1);
			}
		}
	}
} else {
	for(var e=0;e<ELEMENTS;e++) {
		if(pop_state(bin[| array[| e]])==2) {
			if(pairs|bin[| array[| e]]!=pairs) {
				for(var v=pairs;v>0;v&=v-1) {
					if(bin[| array[| e]]&~(v&-v)!=bin[| array[| e]]) {
						ds_list_replace(coloring[| array[| e]],log2(v&-v),c_yellow);
						r++;
					}
				}
			} else {
				squarecolor[| array[| e]]=c_green;
			}
		}
	}
	if(r>0) {
		for(var e=0;e<ELEMENTS;e++) {
			if(pop_state(bin[| array[| e]])==2) {
				if(pairs|bin[| array[| e]]==pairs) {
					squarecolor[| array[| e]]=c_green;
				}
			}
		}
	}
}

return r;